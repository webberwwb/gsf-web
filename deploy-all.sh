#!/bin/bash
set -e

# Set your project ID
PROJECT_ID="focused-mote-477703-f0"

echo "Deploying to project: $PROJECT_ID"

# Enable required APIs
echo "Enabling required APIs..."
gcloud services enable cloudbuild.googleapis.com run.googleapis.com containerregistry.googleapis.com --project=$PROJECT_ID

# Deploy Backend
echo "Building and deploying backend..."
cd backend
gcloud builds submit --tag gcr.io/$PROJECT_ID/gsf-web-backend --project=$PROJECT_ID
BACKEND_URL=$(gcloud run deploy gsf-web-backend \
    --image gcr.io/$PROJECT_ID/gsf-web-backend \
    --platform managed \
    --region us-central1 \
    --allow-unauthenticated \
    --set-env-vars MYSQL_DATABASE=gsf_web \
    --project=$PROJECT_ID \
    --format="value(status.url)")

echo "Backend deployed at: $BACKEND_URL"

# Deploy Frontend
echo "Building and deploying frontend..."
cd ../frontend
gcloud builds submit --tag gcr.io/$PROJECT_ID/gsf-web-frontend --project=$PROJECT_ID

# Deploy and get the new revision name
NEW_REVISION=$(gcloud run deploy gsf-web-frontend \
    --image gcr.io/$PROJECT_ID/gsf-web-frontend \
    --platform managed \
    --region us-central1 \
    --allow-unauthenticated \
    --set-env-vars VITE_API_BASE_URL=$BACKEND_URL/api \
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
