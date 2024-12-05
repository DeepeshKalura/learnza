from fastapi import APIRouter, Depends, HTTPException, Request
from firebase_admin import auth as firebase_auth
import requests
from app.service.firebase_service import get_auth, get_firestore
from app.util.resource import FREE_BOOK_SOURCES

router = APIRouter(prefix="/library", tags=["library"])


# Utility function to fetch books
def fetch_books_from_source(source: str, title: str):
    try:
        if source == "Project Gutenberg":
            response = requests.get(FREE_BOOK_SOURCES[source], params={"search": title})
            response.raise_for_status()
            books = response.json().get("results", [])
            return books
        elif source == "Open Library":
            response = requests.get(FREE_BOOK_SOURCES[source], params={"q": title}, headers={
                "User-Agent": "DeepeshKalura/1.0 (deepeshkalurs@gmail.com)"
            })
            response.raise_for_status()
            books = response.json().get("docs", [])
            return books

        elif source == "Internet Archive":
            query = f"title:{title}"
            response = requests.get(FREE_BOOK_SOURCES[source], params={
                "q": query,
                "output": "json",
                "rows": 5
            })
            response.raise_for_status()
            books = response.json().get("response", {}).get("docs", [])
            return books

    except requests.exceptions.RequestException as e:
        print(f"Error fetching from {source}: {e}")
        return []

# Endpoint to search books by title
@router.get("/search-books/")
def search_books(title: str, request: Request):
    results = {}
    try:
        source:str = "Open Library"
        books = fetch_books_from_source(source, title)
        results[source] = books
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error fetching books: {str(e)}")
    return {"query": title, "books": results}

# Endpoint to fetch popular books by course
@router.get("/popular-books/")
def popular_books(course: str, request: Request):
    # Example mapping of courses to popular books
    popular_books_mapping = {
        "Computer Science": ["Introduction to Algorithms", "Clean Code", "The Pragmatic Programmer"],
        "Literature": ["Pride and Prejudice", "Hamlet", "Moby Dick"]
    }

    course_books = popular_books_mapping.get(course, [])
    if not course_books:
        raise HTTPException(status_code=404, detail=f"No popular books found for course: {course}")

    results = {}
    try:
        for title in course_books:
            for source in FREE_BOOK_SOURCES.keys():
                books = fetch_books_from_source(source, title)
                if source not in results:
                    results[source] = []
                results[source].extend(books)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error fetching popular books: {str(e)}")

    return {"course": course, "popular_books": results}


@router.get(path="")
async def gather_books(db= Depends(get_firestore), auth = Depends(get_auth) ):

    try:
        result  =  db.collection('books').get()

        books = [doc.to_dict() for doc in result]
        return books

    except Exception as e: 
        raise HTTPException(
            status_code=500,
            detail=f"Failed to fetch books: {str(e)}"
        )


