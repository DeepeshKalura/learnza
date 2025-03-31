"""
Email service module that provides functionality for sending various types of emails
using the Resend API and Jinja2 templating engine.
"""

from dataclasses import dataclass
from jinja2 import Environment, FileSystemLoader
import resend
from firebase_functions.params import SecretParam

resend_api =  SecretParam("RESENDAPI").value
# For debugging, only print a masked version of the key if necessary
if resend_api:
    masked_key = resend_api[:4] + "*" * (len(resend_api) - 8) + resend_api[-4:] if len(resend_api) > 8 else "****"
    print("resend_api configured: \t", masked_key)


@dataclass
class EmailService:
    """
    A service class that handles email composition and delivery through the Resend API.
    Provides methods for sending different types of system emails with templated content.
    """

    env = Environment(loader=FileSystemLoader("templates/emails"))
    resend = resend
    resend.api_key = resend_api

    async def send_welcome_email(
        self, email: str, full_name: str, temp_password: str, role: str
    ):
        """
        Sends a welcome email to a new user with their temporary password.

        Args:
            email: The recipient's email address
            full_name: The recipient's full name
            temp_password: Temporary password for first login
            role: User role (admin, user, student) affecting email content

        Returns:
            bool: True if email was sent successfully, False otherwise
        """
        try:
            # Dynamic subject based on role
            subject_map = {
                "admin": "Welcome to the Admin Portal",
                "user": "Welcome to the User Portal",
                "student": "Welcome to the Student Portal",
            }
            subject = subject_map.get(role, "Welcome to Our Portal")

            # Render the template with role-specific data
            template = self.env.get_template("welcome.html")
            html_content = template.render(
                full_name=full_name, temp_password=temp_password, role=role
            )

            try:
                self.resend.Contacts.create(
                    {
                        "first_name": full_name.split()[0],
                        "email": email,
                        "last_name": full_name.split()[-1],
                        "unsubscribed": False,
                        "audience_id": "0789145b-071e-4125-98c7-6383c653e605",
                    }
                )
            except (ValueError, TypeError) as e:
                print(f"Error creating contact: {str(e)}")

            # Send the email
            self.resend.Emails.send(
                {
                    "from": "noreply@lernza.deepeshkalura.xyz",
                    "to": email,
                    "subject": subject,
                    "html": html_content,
                }
            )
            return True
        except (ValueError, TypeError) as e:
            print(f"Error sending email: {str(e)}")
            return False
