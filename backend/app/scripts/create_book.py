import csv 
import json

import os
from datetime import datetime, timedelta

import firebase_admin
from firebase_admin import credentials, firestore, auth, storage
from functools import lru_cache

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




def main():
    # Load book data from JSON file
    firestore = get_firestore()
    with open('json/newBooks.json', 'r') as f:
        books = json.load(f)

    for book in books:
        # Upload thumbnail and book files to Firebase Storage
        if 'thumbnail' in book: # and os.path.exists(book['thumbnail']):
            if (book['thumbnail'] != None):
                if(os.path.exists(book['thumbnail'])):

                    print(book['thumbnail'])
                    book['thumbnail'] = upload_to_storage(book['thumbnail'], f"thumbnails/{os.path.basename(book['thumbnail'])}")
        
        if 'bookUrl' in book: # and os.path.exists(book['bookUrl']):
            if (book['bookUrl'] != None):
                if(os.path.exists(book['bookUrl'])):
                    print(book['bookUrl'])
                    book['bookUrl'] = upload_to_storage(book['bookUrl'], f"books/{os.path.basename(book['bookUrl'])}")
        
        # Update timestamps
        now = datetime.utcnow().isoformat() + "Z"
        book['createdAt'] =  now
        book['updatedAt'] = now

        firestore.collection('books').document(book["id"]).set(book)
    # Create a CSV file



    print("Process completed successfully. Files uploaded and CSV created.")


def uploadImage():
    with open('json/newBooks.json', 'r') as f:
        books = json.load(f)
    

    for book in books: 
        if (book['thumbnail'] != None):
            if(os.path.exists(book['thumbnail'])):

                print(book['thumbnail'])
                book['thumbnail'] = upload_to_storage(book['thumbnail'], f"thumbnails/{os.path.basename(book['thumbnail'])}")
                print(book['thumbnail'])



if __name__ == "__main__":
    main()
    # uploadImage()
