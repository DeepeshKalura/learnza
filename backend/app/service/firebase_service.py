import firebase_admin
from firebase_admin import credentials, firestore, auth, storage
from functools import lru_cache
from fastapi import Depends

class FirebaseService:
    _instance = None

    def __init__(self):
        if not firebase_admin._apps:
            cred = credentials.Certificate('serviceAccountKey.json')
            firebase_admin.initialize_app(cred)
        self.db = firestore.client()
        self.auth = auth
        self.storage = storage

    @property
    def firestore(self):
        return self.db
    
    @property
    def authentication(self) -> auth:
        return self.auth
    
    @property
    def cloud_storage(self) -> storage:
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