import os

from dotenv import find_dotenv , load_dotenv

load_dotenv(find_dotenv())

class Config: 
    resend_api = os.getenv("RESENDAPI")
