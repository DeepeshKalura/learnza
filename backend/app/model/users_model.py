from datetime import datetime
from typing import Any, Optional, List, Dict
from pydantic import BaseModel, EmailStr, Field
from enum import Enum

class UserRole(str, Enum):
    ADMIN = "admin"
    TEACHER = "teacher"
    STUDENT = "student"

class UnifiedUserModel(BaseModel):
    # Required fields
    uid: str
    email: EmailStr
    fullName: str
    role: UserRole
    isActive: bool = True
    createdAt: str

    # Common optional fields
    isEmailVerified: Optional[str] = None
    lastLogin: Optional[str] = None
    profileImage: Optional[str] = None
    phoneNumber: Optional[str] = None
    
    # Admin specific fields
    isSuperAdmin: Optional[bool] = None
    
    # Teacher specific fields
    isHeadTeacher: Optional[bool] = None
    departmentId: Optional[str] = None
    assignedCourseIds: Optional[List[str]] = None
    canInviteTeachers: Optional[bool] = None
    
    # Student specific fields
    enrolledDepartmentId: Optional[str] = None
    enrolledCourseIds: Optional[List[str]] = None
    isOnProbation: Optional[bool] = None
    
    # Status tracking
    banReason: Optional[str] = None
    banExpiry: Optional[str] = None
    bannedBy: Optional[str] = None
    lastActiveAt: Optional[str] = None
    activityLog: Optional[Dict[str, Any]] = None

    class Config:
        from_attributes = True
        use_enum_values = True

class UserCreationRequest(BaseModel):
    user: UnifiedUserModel
    password: str

class UserCreationResponse(BaseModel):
    message: str
    userId: str