# Deployment scripts for Cloud Run

# Build and deploy backend
# Usage: ./deploy-backend.sh YOUR_PROJECT_ID
#!/bin/bash
set -e

PROJECT_ID=$1
if [ -z "$PROJECT_ID" ]; then
    echo "Usage: ./deploy-backend.sh YOUR_PROJECT_ID"
    exit 1
fi

cd backend
gcloud builds submit --tag gcr.io/$PROJECT_ID/gsf-web-backend
gcloud run deploy gsf-web-backend \
    --image gcr.io/$PROJECT_ID/gsf-web-backend \
    --platform managed \
    --region us-central1 \
    --allow-unauthenticated \
    --set-env-vars MYSQL_DATABASE=gsf_web

echo "Backend deployed successfully!"

