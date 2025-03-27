"""User data models for authentication and authorization."""

from enum import Enum
from typing import List, Optional
from datetime import datetime
from pydantic import BaseModel, Field, ConfigDict


class UserRole(str, Enum):
    """Defines the possible roles a user can have in the system."""

    ADMIN = "admin"
    TEACHER = "teacher"
    STUDENT = "student"
    BOT = "bot"


class UserModel(BaseModel):
    """
    Unified user model that handles all user types in the system.
    Contains common fields and role-specific optional fields.
    """

    # Required fields
    role: UserRole
    title: Optional[str] = None

    # Students
    uid: str
    email: str
    fullName: str
    address: Optional[str] = None
    phoneNumber: Optional[str] = None
    profileImageURL: Optional[str] = None
    batch: Optional[str] = None
    motherName: Optional[str] = None
    fatherName: Optional[str] = None

    # Message
    lastseen: Optional[str] = None
    isActive: bool = True
    isOnline: bool = False
    blockedUsers: List[str] = Field(default_factory=list)
    contactUsers: List[str] = Field(default_factory=list)

    # Teachers
    courseId: Optional[str] = None

    # Future purpose
    departmentId: Optional[str] = None

    # Status tracking
    banReason: Optional[str] = None
    bannedById: Optional[str] = None
    createdAt: str = Field(default_factory=lambda: datetime.now().isoformat())

    model_config = ConfigDict(from_attributes=True, use_enum_values=True)
