#!/bin/bash
set -e

# Set your project ID
PROJECT_ID="focused-mote-477703-f0"

echo "Deploying to project: $PROJECT_ID"

# Skip API enablement - assume they're already enabled
# If you need to enable them, run manually:
# gcloud services enable cloudbuild.googleapis.com run.googleapis.com containerregistry.googleapis.com --project=$PROJECT_ID

# Deploy Backend
echo "Building and deploying backend..."

# Read SendGrid API key from backend/.env if it exists
if [ -f "backend/.env" ]; then
    SENDGRID_API_KEY=$(grep "^SENDGRID_API_KEY=" backend/.env | cut -d '=' -f2 | tr -d '"' | tr -d "'")
    MAIL_FROM=$(grep "^MAIL_FROM=" backend/.env | cut -d '=' -f2 | tr -d '"' | tr -d "'" || echo "web@grainstoryfarm.ca")
else
    SENDGRID_API_KEY=""
    MAIL_FROM="web@grainstoryfarm.ca"
fi

# Build env vars string
BACKEND_ENV_VARS="MYSQL_DATABASE=gsf_web"
if [ ! -z "$SENDGRID_API_KEY" ]; then
    BACKEND_ENV_VARS="$BACKEND_ENV_VARS,SENDGRID_API_KEY=$SENDGRID_API_KEY"
fi
BACKEND_ENV_VARS="$BACKEND_ENV_VARS,MAIL_FROM=$MAIL_FROM"

cd backend
gcloud builds submit --tag gcr.io/$PROJECT_ID/gsf-web-backend --project=$PROJECT_ID
BACKEND_URL=$(gcloud run deploy gsf-web-backend \
    --image gcr.io/$PROJECT_ID/gsf-web-backend \
    --platform managed \
    --region us-central1 \
    --allow-unauthenticated \
    --set-env-vars $BACKEND_ENV_VARS \
    --project=$PROJECT_ID \
    --format="value(status.url)")

echo "Backend deployed at: $BACKEND_URL"

# Deploy Frontend
echo "Building and deploying frontend..."
cd ../frontend

# Create .env.production with the backend URL (this gets baked into the build)
echo "VITE_API_BASE_URL=$BACKEND_URL/api" > .env.production
echo "Building frontend with backend URL: $BACKEND_URL"
npm run build

# Build Docker image with the built dist folder
gcloud builds submit --tag gcr.io/$PROJECT_ID/gsf-web-frontend --project=$PROJECT_ID

# Deploy and get the new revision name
NEW_REVISION=$(gcloud run deploy gsf-web-frontend \
    --image gcr.io/$PROJECT_ID/gsf-web-frontend \
    --platform managed \
    --region us-central1 \
    --allow-unauthenticated \
    --project=$PROJECT_ID \
    --format="value(metadata.name)" 2>&1)

# Check if deployment was successful
if [ $? -eq 0 ] && [ ! -z "$NEW_REVISION" ]; then
    echo "Waiting for revision to be ready..."
    sleep 10
    
    # Wait for revision to be ready (check status)
    for i in {1..30}; do
        REVISION_STATUS=$(gcloud run revisions describe $NEW_REVISION \
            --region us-central1 \
            --project=$PROJECT_ID \
            --format="value(status.conditions[0].status)" 2>/dev/null || echo "False")
        
        if [ "$REVISION_STATUS" = "True" ]; then
            echo "Revision $NEW_REVISION is ready!"
            break
        fi
        echo "Waiting for revision to be ready... ($i/30)"
        sleep 5
    done
    
    # Route traffic to the new revision
    echo "Routing traffic to new revision..."
    gcloud run services update-traffic gsf-web-frontend \
        --to-revisions=$NEW_REVISION=100 \
        --region us-central1 \
        --project=$PROJECT_ID 2>&1 || echo "Warning: Could not route traffic automatically"
    
    FRONTEND_URL=$(gcloud run services describe gsf-web-frontend \
        --region us-central1 \
        --project=$PROJECT_ID \
        --format="value(status.url)")
    
    echo "Frontend deployed at: $FRONTEND_URL"
    echo "New revision: $NEW_REVISION"
else
    echo "ERROR: Frontend deployment failed!"
    exit 1
fi

echo "Deployment complete!"
