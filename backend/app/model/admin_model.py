from pydantic import BaseModel, EmailStr
from typing import Optional
from datetime import datetime, timezone



# Admin User Creation Request

class UsersModel(BaseModel):
    uid: str  
    email: EmailStr  
    fullName: str  
    role: str  
    isActive: bool  
    isSuperAdmin: Optional[bool] = False 
    createdAt: datetime
    class Config:
        from_attributes = True



class AdminUserCreationRequestModel(BaseModel):
    user: UsersModel
    password: str


class AdminUserCreationResponseModel(BaseModel):
    message: str


