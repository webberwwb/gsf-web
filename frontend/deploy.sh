# Deployment scripts for Cloud Run

# Build and deploy frontend
# Usage: ./deploy-frontend.sh YOUR_PROJECT_ID YOUR_BACKEND_URL
#!/bin/bash
set -e

PROJECT_ID=$1
BACKEND_URL=$2
if [ -z "$PROJECT_ID" ] || [ -z "$BACKEND_URL" ]; then
    echo "Usage: ./deploy-frontend.sh YOUR_PROJECT_ID YOUR_BACKEND_URL"
    exit 1
fi

cd frontend
gcloud builds submit --tag gcr.io/$PROJECT_ID/gsf-web-frontend
gcloud run deploy gsf-web-frontend \
    --image gcr.io/$PROJECT_ID/gsf-web-frontend \
    --platform managed \
    --region us-central1 \
    --allow-unauthenticated \
    --set-env-vars VITE_API_BASE_URL=$BACKEND_URL/api

echo "Frontend deployed successfully!"

