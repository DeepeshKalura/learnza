from jinja2 import Environment, FileSystemLoader
import resend

from app.util.config import Config 


class EmailService:

    def __init__(self):

        # templates_path = os.path.join(os.path.dirname(__file__), 'templates', 'emails')

        self.env = Environment(
            loader=FileSystemLoader('templates/emails')
        )
        self.resend = resend 
        self.resend.api_key = Config.resend_api
    
    async def send_welcome_email(self, email: str, full_name: str, temp_password: str, role: str):

        try:
            # Dynamic subject based on role
            subject_map = {
                "admin": "Welcome to the Admin Portal",
                "user": "Welcome to the User Portal",
                "student": "Welcome to the Student Portal"
            }
            subject = subject_map.get(role, "Welcome to Our Portal")
            
            # Render the template with role-specific data
            template = self.env.get_template('welcome.html')
            html_content = template.render(
                full_name=full_name,
                temp_password=temp_password,
                role=role
            )
            
            # Send the email
            self.resend.Emails.send({
                "from": "noreply@lernza.deepeshkalura.xyz",
                "to": email,
                "subject": subject,
                "html": html_content
            })
            return True
        except Exception as e:
            print(f"Error sending email: {str(e)}")
            return False
