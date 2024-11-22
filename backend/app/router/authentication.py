from fastapi import APIRouter, Depends, HTTPException, Request
from firebase_admin import auth as firebase_auth
import json
import traceback

from app.model.users_model import UserCreationRequest, UserCreationResponse
from app.service.email_service import EmailService
from app.service.firebase_service import get_auth, get_firestore

router = APIRouter(prefix="/auth", tags=["Authentication"])

email_service = EmailService()

@router.post("", response_model=UserCreationResponse)
async def create_user(
    user_request: UserCreationRequest,
    db = Depends(get_firestore),
    auth = Depends(get_auth)
):
    try:
        # Log incoming request for debugging
        print(f"Creating user with role: {user_request.user.role}")
        print(f"Received user data: {user_request.user.model_dump()}")
        
        # Create user in Firebase Auth
        user = auth.create_user(
            uid=user_request.user.uid,
            email=user_request.user.email,
            password=user_request.password,
            display_name=user_request.user.fullName,

            
        )

        # Convert the model to JSON, removing None values
        user_data = json.loads(
            user_request.user.model_dump_json(exclude_none=True)
        )
        print("Data to be stored in Firestore:", user_data)

        # Store in Firestore
        db.collection('users').document(user_request.user.uid).set(user_data)

        # Send welcome email based on role
        email_sent = await email_service.send_welcome_email(
            email=user_request.user.email,
            full_name=user_request.user.fullName,
            temp_password=user_request.password,
            role=user_request.user.role
        )
        
        if not email_sent:
            print(f"Warning: Welcome email failed to send to {user_request.user.email}")
        
        return UserCreationResponse(
            message=f"User created successfully with role: {user_request.user.role}",
            userId=user_request.user.uid
        )
    
    except firebase_auth.EmailAlreadyExistsError:
        raise HTTPException(
            status_code=400,
            detail="Email already exists"
        )
    except Exception as e:
        print(f"Error creating user: {str(e)}")
        print("Traceback:", traceback.format_exc())
        raise HTTPException(
            status_code=500,
            detail=f"Failed to create user: {str(e)}"
        )