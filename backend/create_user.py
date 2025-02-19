import asyncio
from datetime import datetime, timedelta
import json
import uuid
import firebase_admin
from firebase_admin import credentials, firestore, auth, storage
from functools import lru_cache
from pydantic import BaseModel
from datetime import datetime
from typing import Any, Optional, List, Dict
from pydantic import BaseModel, EmailStr, Field
from enum import Enum
import random
import string
from jinja2 import Environment, FileSystemLoader
import requests
import resend

from app.util.config import Config 


# firebase service
class FirebaseService:
    _instance = None

    def __init__(self):
        if not firebase_admin._apps:
            cred = credentials.Certificate('serviceAccountKey.json')
            firebase_admin.initialize_app(cred, {
                'storageBucket': 'learnza.firebasestorage.app'
            })
        self.db = firestore.client()
        self.auth = auth
        self.storage = storage.bucket()

    @property
    def firestore(self):
        return self.db
    
    @property
    def authentication(self) :
        return self.auth
    
    @property
    def cloud_storage(self) :
        return self.storage

# To make it singlethon instance 
@lru_cache()
def get_firebase_service() -> FirebaseService:
    return FirebaseService()

# Dependency
def get_firestore():
    service = get_firebase_service()
    return service.firestore

def get_auth():
    service = get_firebase_service()
    return service.authentication

def get_storage():
    service = get_firebase_service()
    return service.cloud_storage

def upload_to_storage(local_path, remote_path):
    """Uploads a file to Firebase storage."""
    bucket = get_storage()
    blob = bucket.blob(remote_path)
    blob.upload_from_filename(local_path)
    download_url = blob.generate_signed_url(
        expiration=datetime.utcnow() + timedelta(days=2000),  # Set expiry duration
        method="GET",
    )
    return download_url

# email service

class EmailService:

    def __init__(self):

        # templates_path = os.path.join(os.path.dirname(__file__), 'templates', 'emails')

        self.env = Environment(
            loader=FileSystemLoader('templates/emails')
        )
        self.resend = resend 
        self.resend.api_key = Config.resend_api
    
    async def send_welcome_email(self, email: str, full_name: str, temp_password: str, role: str, ):

        try:
            # Dynamic subject based on role
            subject_map = {
                "admin": f"e-Shadananda Welcome to {full_name}",
                "user": f"e-Shadananda Welcome to {full_name}",
                "student": f"e-Shadananda Welcome to {full_name}"
            }
            subject = subject_map.get(role, f"e-Shadananda Welcome to {full_name}")
            
            # Render the template with role-specific data
            template = self.env.get_template('welcome.html')
            html_content = template.render(
                full_name=full_name,
                temp_password=temp_password,
                role=role
            )

            try:
            

                self.resend.Contacts.create(

                            {
                            "first_name": full_name.split()[0],
                            "email": email,
                            "last_name": full_name.split()[-1],
                            "unsubscribed": False,
                            'audience_id': "0789145b-071e-4125-98c7-6383c653e605"
                        })
            except Exception as e:
                print(f"Error creating contact: {str(e)}")


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



class UserRole(str, Enum):
    ADMIN = "admin"
    TEACHER = "teacher"
    STUDENT = "student"
    BOT = "bot"

class Users(BaseModel):
    role: UserRole
    title: Optional[str] = None


    # Required fields
    uid: str
    email: EmailStr
    fullName: str
    isActive: bool = True
    createdAt: str

    # common fields
    profileImageURL: Optional[str] = None
    isActive: bool= True 
    courseId : Optional[str] = None

    # students 
    address: Optional[str] = None
    phoneNumber: Optional[str] = None
    batch: Optional[str] = None
    motherName : Optional[str] = None
    fatherName: Optional[str] = None

    #  messages
    lastseen: Optional[str] = None
    isOnline: bool = False
    blockedUsers: Optional[List[str]] = []
    contactUsers: Optional[List[str]] = []

    # Status tracking
    banReason: Optional[str] = None
    bannedById: Optional[str] = None

    class Config:
        from_attributes = True
        use_enum_values = True




def create_random_password(length: int = 12) -> str:
    characters = string.ascii_letters + string.digits
    password = ''.join(random.choice(characters) for i in range(length - 1))
    password += '@'
    password_list = list(password)
    random.shuffle(password_list)
    return ''.join(password_list)

def create_random_avatar():
    seed_list = ["Jack", "George", "Kimberly", "Katherine", "Eliza", "Emery", "Christian", "Jade", "Liam", "Aiden", "Adrian", "Christopher", "Leah", "Easton", "Jameson", "Jude", "Destiny", "Kingston", "Liliana", "Aidan"]
    seed = random.choice(seed_list)
    base_url = "https://api.dicebear.com/9.x/adventurer/svg"
    scale = 110


    url = f"{base_url}?seed={seed}&scale={scale}&backgroundColor=transparent"
    return url

email_service = EmailService()

async def create_teacher():
    db = get_firestore()
    auth = get_auth()


    # load json 

    # in production use this
    with open('students.json', "r+") as f:
        data = json.load(f)

        for user in data:
            id = str(uuid.uuid4())
            avator = create_random_avatar()

            phoneNumber = user.get('phone', None)

            print(f"phoneNumber is {phoneNumber}")
            app_user = Users(
                uid=id,
                email=user['email'],
                fullName=user['name'],
                role=UserRole.STUDENT,
                createdAt=datetime.now().isoformat(),
                profileImageURL=avator,
                phoneNumber=phoneNumber,
            )
            # it looks good
            # print(teacher.model_dump_json())
            password = create_random_password()
            print(f"avatar is {avator}")
            print(f"password is {password}")


            auth.create_user(
                uid=app_user.uid,
                email=app_user.email,
                password=password,
                display_name=app_user.fullName,
                email_verified=True,
                photo_url=app_user.profileImageURL
            )

            auth.set_custom_user_claims(app_user.uid, { "role": app_user.role })

            db.collection('users').document(app_user.uid).set(app_user.model_dump())
            
            email_sent = await email_service.send_welcome_email(
                email=app_user.email,
                full_name=app_user.fullName,
                temp_password=password,
                role=app_user.role,
            )

            if not email_sent:
                print(f"Warning: Welcome email failed to send to {app_user.email}")

                auth.delete_user(app_user.uid)
                db.collection('users').document(app_user.uid).delete()
                exit("Email not sent")

            print(f"{app_user.fullName} created successfully with role: {app_user.role}")

            with open('json/students.json', "a+") as f:
                f.seek(0)
                content = f.read().strip()
                if not content:
                    students = []
                else:
                    try:
                        students = json.loads(content)
                    except json.JSONDecodeError:
                        students = []
                students.append(app_user.model_dump())
                f.seek(0)
                f.truncate()
                json.dump(students, f)
                
            
async def create_student(): 
    db = get_firestore()
    auth = get_auth()


    with open('student.json') as f:
        data = json.load(f)

        for user in data:
            id = str(uuid.uuid4())
            avator = create_random_avatar()

            phoneNumber = user.get('phoneNumber', None)

            print(f"phoneNumber is {phoneNumber}")
            teacher = Users(
                uid=id,
                email=user['email'],
                fullName=user['name'],
                role=UserRole.STUDENT,
                createdAt=datetime.now().isoformat(),
                profileImageURL=avator,
                phoneNumber=phoneNumber,
            )
            # it looks good
            # print(teacher.model_dump_json())
            password = create_random_password()
            print(f"avatar is {avator}")
            print(f"password is {password}")


            auth.create_user(
                uid=teacher.uid,
                email=teacher.email,
                password=password,
                display_name=teacher.fullName,
                email_verified=True,
                photo_url=teacher.profileImageURL
            )

            auth.set_custom_user_claims(teacher.uid, { "role": teacher.role })

            db.collection('users').document(teacher.uid).set(teacher.model_dump())
            

            email_sent = await email_service.send_welcome_email(
                email=teacher.email,
                full_name=teacher.fullName,
                temp_password=password,
                role=teacher.role,
            )

            if not email_sent:
                print(f"Warning: Welcome email failed to send to {teacher.email}")

                auth.delete_user(teacher.uid)
                db.collection('users').document(teacher.uid).delete()
                exit("Email not sent")

            print(f"{teacher.fullName} created successfully with role: {teacher.role}")




if __name__ == "__main__":
    asyncio.run(create_teacher())