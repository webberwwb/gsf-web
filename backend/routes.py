from flask import Blueprint, jsonify, request, current_app
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail as SendGridMail

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

@api_bp.route('/contact', methods=['POST'])
def submit_contact():
    """Handle contact form submission and send email"""
    try:
        data = request.get_json()
        
        # Validate required fields
        if not data or not data.get('name') or not data.get('email') or not data.get('message'):
            return jsonify({
                'success': False,
                'message': 'Name, email, and message are required'
            }), 400
        
        # Prepare email content
        name = data.get('name')
        email = data.get('email')
        phone = data.get('phone', 'N/A')
        website = data.get('website', 'N/A')
        message = data.get('message')
        
        # Get SendGrid API key from config
        sendgrid_api_key = current_app.config.get('SENDGRID_API_KEY')
        if not sendgrid_api_key:
            return jsonify({
                'success': False,
                'message': 'Email service not configured. Please contact the administrator.'
            }), 500
        
        # Create email message using SendGrid
        msg = SendGridMail(
            from_email=current_app.config.get('MAIL_FROM', 'grainstoryfarm@gmail.com'),
            to_emails='grainstoryfarm@gmail.com',
            subject=f'New Contact Form Submission from {name}',
            html_content=f'''
            <html>
            <body>
                <h2>New Contact Form Submission</h2>
                <p><strong>Name:</strong> {name}</p>
                <p><strong>Email:</strong> {email}</p>
                <p><strong>Phone:</strong> {phone}</p>
                <p><strong>Website:</strong> {website}</p>
                <p><strong>Message:</strong></p>
                <p>{message.replace(chr(10), '<br>')}</p>
                <hr>
                <p><em>This email was sent from the GrainStoryFarm contact form.</em></p>
            </body>
            </html>
            ''',
            plain_text_content=f'''
New contact form submission from GrainStoryFarm website:

Name: {name}
Email: {email}
Phone: {phone}
Website: {website}

Message:
{message}

---
This email was sent from the GrainStoryFarm contact form.
            '''
        )
        
        # Send email via SendGrid
        sg = SendGridAPIClient(sendgrid_api_key)
        sg.send(msg)
        
        return jsonify({
            'success': True,
            'message': 'Thank you for contacting us! We will get back to you soon.'
        }), 200
        
    except Exception as e:
        print(f'Error sending email: {str(e)}')
        return jsonify({
            'success': False,
            'message': 'An error occurred while submitting your message. Please try again later.'
        }), 500

