#!/bin/bash
# Helper script for Skeema operations

set -e

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Set Skeema environment based on .env or use defaults
SKEMA_HOST=${MYSQL_HOST:-localhost}
SKEMA_PORT=${MYSQL_PORT:-3306}
SKEMA_USER=${MYSQL_USER:-root}
SKEMA_PASSWORD=${MYSQL_PASSWORD:-}
SKEMA_DATABASE=${MYSQL_DATABASE:-gsf_web}

# Navigate to database directory (script is already in database/)
cd "$(dirname "$0")"

# Function to run skeema commands
run_skeema() {
    skeema "$@" \
        --host="$SKEMA_HOST" \
        --port="$SKEMA_PORT" \
        --user="$SKEMA_USER" \
        --password="$SKEMA_PASSWORD" \
        --schema="$SKEMA_DATABASE"
}

case "$1" in
    init)
        echo "Initializing Skeema..."
        run_skeema init "$SKEMA_DATABASE"
        ;;
    diff)
        echo "Checking for schema differences..."
        run_skeema diff
        ;;
    push)
        echo "Applying schema changes..."
        run_skeema push
        ;;
    pull)
        echo "Pulling current schema from database..."
        run_skeema pull
        ;;
    lint)
        echo "Linting schema files..."
        run_skeema lint
        ;;
    format)
        echo "Formatting schema files..."
        run_skeema format
        ;;
    *)
        echo "Usage: $0 {init|diff|push|pull|lint|format}"
        echo ""
        echo "Commands:"
        echo "  init   - Initialize Skeema in the database directory"
        echo "  diff   - Show differences between schema files and database"
        echo "  push   - Apply schema changes to database"
        echo "  pull   - Pull current schema from database to files"
        echo "  lint   - Lint schema files for issues"
        echo "  format - Format schema files"
        exit 1
        ;;
esac

