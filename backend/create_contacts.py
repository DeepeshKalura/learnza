import json
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
    
    def send_welcome_email(self):

        with open('teacher.json') as f:
            
            try:
                datas = json.load(f)
                for data in datas: 
            
                    full_name:str = data['name']
                    email:str = data['email']

                
                    try:
                        self.resend.Contacts.create(

                            {
                            "first_name": full_name.split()[0],
                            "email": email,
                            "last_name": full_name.split()[-1],
                            "unsubscribed": False,
                            'audience_id': "0789145b-071e-4125-98c7-6383c653e605"
                        })
                        print("Contact created successfully")
                    except Exception as e:
                        print(f"Error creating contact: {str(e)}")
            except Exception as e:
                print(f"Error sending email: {str(e)}")
                return False
        
EmailService().send_welcome_email()