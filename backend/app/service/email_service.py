import os
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
    
    async def send_welcome_email(self, email: str, full_name: str, temp_password: str):
        template = self.env.get_template('welcome.html')
        html_content = template.render(
            full_name=full_name,
            temp_password=temp_password
        )
        
        try:
            self.resend.Emails.send({
                "from": "noreply@lernza.deepeshkalura.xyz",
                "to": email,
                "subject": "Welcome to User",
                "html": html_content
            })
            return True
        except Exception as e:
            print(f"Error sending email: {str(e)}")
            return False