from flask import Blueprint, jsonify, request
from models import db

api_bp = Blueprint('api', __name__)

@api_bp.route('/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    return jsonify({
        'status': 'healthy',
        'message': 'API is running'
    }), 200

@api_bp.route('/test', methods=['GET'])
def test():
    """Test endpoint"""
    return jsonify({
        'message': 'Backend is working!',
        'data': {
            'timestamp': '2024-01-01T00:00:00Z'
        }
    }), 200

# Add your API routes here
# @api_bp.route('/your-endpoint', methods=['GET', 'POST'])
# def your_endpoint():
#     # Your logic here
#     return jsonify({'message': 'Success'}), 200

