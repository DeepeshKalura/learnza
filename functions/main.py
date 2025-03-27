"""
Firebase Cloud Functions module for Learnza application.
Handles HTTP requests and Firebase service initialization.
"""

import traceback
import json
import random
import asyncio as _asyncio
from firebase_functions import https_fn
from firebase_admin import initialize_app, credentials, firestore, auth, storage

from email_service import EmailService
from model import UserModel as _UserModel, UserRole as _UserRole
from utils import create_random_avatar

cred = credentials.Certificate("serviceAccountKey.json")

app = initialize_app(cred, {"storageBucket": "learnza.firebasestorage.app"})

db = firestore.client()
auth_client = auth
storage_client = storage.bucket()

email_service = EmailService()


@https_fn.on_request()
def on_request_example(_: https_fn.Request) -> https_fn.Response:
    """Handle HTTP requests and return a Hello World response."""
    return https_fn.Response("Hello world!")


@https_fn.on_request()
def create_new_user_by_admin(request: https_fn.Request) -> https_fn.Response:
    """
    Create a new user by admin.

    Accepts a POST request with user details in the request body.
    Only users with admin role can access this function.

    Request body should contain:
    - email: Email address for the new user
    - password: Initial password
    - fullName: User's full name
    - role: User role (admin, teacher, student, bot)
    - Additional fields based on user role

    Returns:
    - Success response with user data
    - Error response with appropriate status code
    """
    # Check request method
    if request.method != "POST":
        return https_fn.Response(
            json.dumps({"message": "Method not allowed"}),
            status=405,
            content_type="application/json",
        )

    try:
        # Parse request body
        request_data = request.get_json()

        if not request_data:
            return https_fn.Response(
                json.dumps({"message": "Invalid request body"}),
                status=400,
                content_type="application/json",
            )

        # Extract required fields
        email = request_data.get("email")
        full_name = request_data.get("fullName")
        role = request_data.get("role")
        password = "".join(
            random.choices(
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", k=10
            )
        )
        profile_image_url = request_data.get("profileImageURL")
        phone_number = request_data.get("phoneNumber")

        if profile_image_url is None:
            profile_image_url = create_random_avatar()
        # Validate required fields
        if not all([email, full_name, role]):
            return https_fn.Response(
                json.dumps({"message": "Missing required fields"}),
                status=400,
                content_type="application/json",
            )

        # Validate role
        try:
            role = _UserRole(role)
        except ValueError:
            return https_fn.Response(
                json.dumps(
                    {
                        "message": f"Invalid role. Must be one of: {[r.value for r in _UserRole]}"
                    }
                ),
                status=400,
                content_type="application/json",
            )

        # Create user in Firebase Auth
        user_record = auth.create_user(
            email=email,
            password=password,
            display_name=full_name,
            email_verified=True,
            photo_url=profile_image_url,
            phone_number=phone_number,
        )

        auth.set_custom_user_claims(user_record.uid, {"role": role})

        _asyncio.run(email_service.send_welcome_email(email, full_name, password, role))

        # Prepare user data model
        user_data = {
            "uid": user_record.uid,
            "email": email,
            "fullName": full_name,
            "role": role.value,
            "isActive": True,
        }
        user_data["address"] = request_data.get("address")
        user_data["title"] = request_data.get("title")
        user_data["batch"] = request_data.get("batch")
        user_data["motherName"] = request_data.get("motherName")
        user_data["fatherName"] = request_data.get("fatherName")
        user_data["lastseen"] = request_data.get("lastseen")
        user_data["isOnline"] = request_data.get("isOnline", False)
        user_data["blockedUsers"] = request_data.get("blockedUsers", [])
        user_data["contactUsers"] = request_data.get("contactUsers", [])
        user_data["courseId"] = request_data.get("courseId")
        user_data["departmentId"] = request_data.get("departmentId")
        user_data["banReason"] = request_data.get("banReason")
        user_data["profileImageURL"] = profile_image_url

        # Add any additional fields from request
        for key, value in request_data.items():
            if key not in user_data and hasattr(_UserModel, key):
                user_data[key] = value

        # Validate data against model
        user_model = _UserModel(**user_data)

        # Save to Firestore
        db.collection("users").document(user_record.uid).set(
            user_model.model_dump(exclude_unset=True)
        )

        # Set custom claims for role-based auth
        auth_client.set_custom_user_claims(user_record.uid, {"role": role.value})

        # Return success response
        return https_fn.Response(
            json.dumps(
                {
                    "success": True,
                    "message": f"User created successfully with ID: {user_record.uid}",
                    "user": user_model.model_dump(exclude_unset=True),
                }
            ),
            status=201,
            content_type="application/json",
        )

    except Exception as e:  # pylint: disable=broad-exception-caught
        error_details = {"error": str(e), "traceback": traceback.format_exc()}
        print(f"Error creating user: {error_details}")

        return https_fn.Response(
            json.dumps({"error": "Internal server error", "details": str(e)}),
            status=500,
            content_type="application/json",
        )
