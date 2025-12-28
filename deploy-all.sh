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
FRONTEND_URL=$(gcloud run deploy gsf-web-frontend \
    --image gcr.io/$PROJECT_ID/gsf-web-frontend \
    --platform managed \
    --region us-central1 \
    --allow-unauthenticated \
    --set-env-vars VITE_API_BASE_URL=$BACKEND_URL/api \
    --project=$PROJECT_ID \
    --format="value(status.url)")

echo "Frontend deployed at: $FRONTEND_URL"
echo "Deployment complete!"
