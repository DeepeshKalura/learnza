import json
import traceback
from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException

from app.model.admin_model import AdminUserCreationRequestModel, AdminUserCreationResponseModel
from app.service.email_service import EmailService
from app.service.firebase_service import get_firestore, get_auth
from firebase_admin import auth as firebase_auth

router = APIRouter(prefix="/teacher", tags=["Teacher"])


email_service = EmailService()


@router.post("/", response_model=AdminUserCreationResponseModel)
async def create_admin_user(
    request: AdminUserCreationRequestModel,
    db = Depends(get_firestore),
    auth = Depends(get_auth)
):
    try:
        
        user = auth.create_user(
            uid=request.user.uid,
            email=request.user.email,
            password=request.password,
            display_name=request.user.fullName
        )

        user_data = json.loads(request.user.model_dump_json())
        print(user_data)


        db.collection('users').document(request.user.uid).set(user_data)


        

        email_sent = await email_service.send_welcome_email(
            email=request.user.email,
            full_name=request.user.fullName,
            temp_password=request.password
        )
        
        if not email_sent:
            print(f"Warning: Welcome email failed to send to {request.user.email}")
        
        return AdminUserCreationResponseModel(
            message=f"Admin user created successfully: {request.user.uid}"
        )
    
    except firebase_auth.EmailAlreadyExistsError:
        raise HTTPException(
            status_code=400,
            detail="Email already exists"
        )
    except Exception as e :
        # Log the error for debugging
        print(f"Error creating admin user: {str(e)}")
        print(traceback.format_exc())
        raise HTTPException(
            status_code=500,
            detail="Failed to create admin user"
        )