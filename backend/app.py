from flask import Flask
from flask_cors import CORS
from config import Config
from models import db

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)
    
    # Initialize extensions
    db.init_app(app)
    # CORS - only allow requests from your domain
    allowed_origins = [
        "https://grainstoryfarm.ca",
        "https://www.grainstoryfarm.ca",
        "https://gsf-web-frontend-tct5yovb4q-uc.a.run.app",
        "https://backend.grainstoryfarm.ca"  # In case you map a subdomain later
    ]
    CORS(app, resources={r"/api/*": {"origins": allowed_origins}})
    
    # Register blueprints
    from routes import api_bp
    app.register_blueprint(api_bp, url_prefix='/api')
    
    # Note: Database migrations are handled by Skeema
    # Do not use db.create_all() in production
    
    return app

if __name__ == '__main__':
    app = create_app()
    app.run(host='0.0.0.0', port=5001, debug=True)

