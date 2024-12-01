import json
from datetime import datetime
from app.service.firebase_service import get_firestore


def create_course_script():
    database = get_firestore()

    with open('json/course.json', 'r') as file:
        courses = json.load(file)
    
    for course in courses:
        current_time = datetime.utcnow().isoformat() + 'Z'  # ISO 8601 format with 'Z' for UTC time
        course['createdAt'] = current_time
        course['updatedAt'] = current_time
        database.collection('courses').add(course)

