# GSF Web Project

A mobile-friendly business introduction website built with Vue.js 3 frontend and Flask backend, deployed on Google Cloud Run.

## Project Structure

```
gsf-web/
├── frontend/          # Vue.js 3 frontend application
├── backend/          # Flask backend API
├── database/         # Skeema database migration files
├── instance/         # Local scripts, credentials, keys (git-ignored)
└── LICENSE           # Apache 2.0 License
```

## Tech Stack

- **Frontend**: Vue.js 3, Vite, Vue Router, Axios
- **Backend**: Flask, SQLAlchemy, PyMySQL
- **Database**: MySQL
- **Migrations**: Skeema
- **Deployment**: Google Cloud Run
- **Containerization**: Docker

## Prerequisites

- Node.js 20+ and npm
- Python 3.11+
- MySQL 8.0+
- Skeema (for database migrations) - [Installation Guide](https://www.skeema.io/download/)
- Google Cloud SDK (for deployment)

## Local Development Setup

### Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Create a `.env` file (copy from `.env.example` if available) with your MySQL credentials:
```
SECRET_KEY=your-secret-key-here
MYSQL_HOST=localhost
MYSQL_PORT=3306
MYSQL_USER=root
MYSQL_PASSWORD=your-password
MYSQL_DATABASE=gsf_web
```

5. Create the MySQL database:
```sql
CREATE DATABASE gsf_web;
```

6. Set up database schema using Skeema:
```bash
cd database
./skeema.sh init
# Edit schema files in database/schema/ as needed
./skeema.sh push
```

7. Run the Flask application:
```bash
python app.py
```

The backend will be available at `http://localhost:5000`

### Frontend Setup

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file (optional, defaults to `/api`):
```
VITE_API_BASE_URL=http://localhost:5000/api
```

4. Run the development server:
```bash
npm run dev
```

The frontend will be available at `http://localhost:3000`

## Building for Production

### Frontend
```bash
cd frontend
npm run build
```

### Backend
The backend is ready for production deployment with gunicorn.

## Deployment to Google Cloud Run

### Prerequisites
1. Google Cloud Project created
2. Cloud SQL MySQL instance set up (or use Cloud SQL connection)
3. Google Cloud SDK installed and authenticated

### Deploy Backend

1. Update the `deploy.sh` script with your project ID
2. Set up Cloud SQL connection or update environment variables
3. Run:
```bash
cd backend
./deploy.sh YOUR_PROJECT_ID
```

### Deploy Frontend

1. Update the `deploy.sh` script with your project ID and backend URL
2. Run:
```bash
cd frontend
./deploy-frontend.sh YOUR_PROJECT_ID https://YOUR_BACKEND_URL
```

### Manual Deployment

You can also use the Cloud Run YAML files:
```bash
# Backend
gcloud run services replace backend/cloud-run.yaml

# Frontend
gcloud run services replace frontend/cloud-run.yaml
```

## Environment Variables

### Backend
- `SECRET_KEY`: Flask secret key for sessions
- `MYSQL_HOST`: MySQL host address
- `MYSQL_PORT`: MySQL port (default: 3306)
- `MYSQL_USER`: MySQL username
- `MYSQL_PASSWORD`: MySQL password
- `MYSQL_DATABASE`: MySQL database name
- `PORT`: Port for the application (set by Cloud Run)

### Frontend
- `VITE_API_BASE_URL`: Backend API base URL

## Database Migrations

This project uses **Skeema** for database schema management and migrations.

### Installing Skeema

Download Skeema from [https://www.skeema.io/download/](https://www.skeema.io/download/) and add it to your PATH.

### Skeema Workflow

1. **Initialize Skeema** (first time setup):
   ```bash
   cd database
   ./skeema.sh init
   ```

2. **Define your schema** in SQL files under `database/schema/`:
   - Edit `database/schema/base.sql` or create new `.sql` files
   - Define tables, indexes, foreign keys, etc.

3. **Check differences** before applying:
   ```bash
   ./skeema.sh diff
   ```

4. **Apply schema changes** to database:
   ```bash
   ./skeema.sh push
   ```

5. **Pull current schema** from database (if schema exists):
   ```bash
   ./skeema.sh pull
   ```

### Skeema Configuration

Configuration is stored in `database/.skeema`. Update it with your database connection details:

```ini
host=localhost
port=3306
user=root
password=your-password
default-schema=gsf_web
```

### For Cloud SQL

When connecting to Cloud SQL, update `database/.skeema` with SSL configuration:
```ini
ssl-mode=REQUIRED
ssl-ca=/path/to/server-ca.pem
ssl-cert=/path/to/client-cert.pem
ssl-key=/path/to/client-key.pem
```

### Best Practices

- Always review `skeema diff` output before running `skeema push`
- Commit schema files to version control
- Use descriptive file names in `database/schema/` for organization
- Test migrations on a development database first

For more information, see the [Skeema documentation](https://www.skeema.io/docs/).

## Instance Folder

The `instance/` folder is git-ignored and can be used for:
- Local configuration files
- Credentials and API keys
- Local development scripts
- Development-only files

This folder will not be committed to version control, making it safe for storing sensitive information and local-only files.

## Mobile-Friendly Features

- Responsive design with mobile-first approach
- Touch-friendly UI elements
- Optimized viewport settings
- Fast loading with code splitting
- Progressive Web App ready (can be extended)

## API Endpoints

- `GET /api/health` - Health check endpoint
- `GET /api/test` - Test endpoint

Add your business-specific endpoints in `backend/routes.py`

## License

Apache License 2.0 - See LICENSE file for details

## Contributing

1. Create a feature branch
2. Make your changes
3. Test locally
4. Submit a pull request

## Support

For questions or issues, please open an issue in the repository.

