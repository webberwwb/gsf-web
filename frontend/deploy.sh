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

# Check if deployment was successful and route traffic
if [ $? -eq 0 ] && [ ! -z "$NEW_REVISION" ]; then
    echo "Waiting for revision to be ready..."
    sleep 10
    
    # Wait for revision to be ready
    for i in {1..30}; do
        REVISION_STATUS=$(gcloud run revisions describe $NEW_REVISION \
            --region us-central1 \
            --project=$PROJECT_ID \
            --format="value(status.conditions[0].status)" 2>/dev/null || echo "False")
        
        if [ "$REVISION_STATUS" = "True" ]; then
            echo "Revision $NEW_REVISION is ready!"
            break
        fi
        sleep 5
    done
    
    # Route traffic to the new revision
    echo "Routing traffic to new revision..."
    gcloud run services update-traffic gsf-web-frontend \
        --to-revisions=$NEW_REVISION=100 \
        --region us-central1 \
        --project=$PROJECT_ID 2>&1 || echo "Warning: Could not route traffic automatically"
    
    echo "Frontend deployed successfully! Revision: $NEW_REVISION"
else
    echo "ERROR: Frontend deployment failed!"
    exit 1
fi

