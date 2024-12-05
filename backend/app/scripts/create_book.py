import csv 
import json

import os
from datetime import datetime, timedelta

from app.service.firebase_service import get_storage, get_firestore

def upload_to_storage(local_path, remote_path):
    """Uploads a file to Firebase storage."""
    bucket = get_storage()
    blob = bucket.blob(remote_path)
    blob.upload_from_filename(local_path)
    download_url = blob.generate_signed_url(
        expiration=datetime.utcnow() + timedelta(days=700),  # Set expiry duration
        method="GET",
    )
    return download_url


def create_csv(data, csv_file_path):
    """Creates a CSV file from the provided data."""
    with open(csv_file_path, mode='w+', newline='', encoding='utf-8') as csv_file:
        writer = csv.writer(csv_file)
        headers = [
            'isbn', 'bookTitle', 'author',
        ]
        writer.writerow(headers)
        for book in data:
            writer.writerow([
                book.get('isbn'),
                book.get('bookTitle'),
                ", ".join(book.get('author', [])),
            ])



def main():
    # Load book data from JSON file
    firestore = get_firestore()
    with open('json/book2.json', 'r') as f:
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
    create_csv(books, 'books.csv')



    print("Process completed successfully. Files uploaded and CSV created.")

if __name__ == "__main__":
    main()
