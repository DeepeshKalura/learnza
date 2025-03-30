"""
Main test file contains tests for the main.py file
"""

from dataclasses import dataclass
import pytest
from main import create_new_user_by_admin


# ---------- Mock Request Classes for Various Scenarios ----------


@dataclass
class GetMockRequest:
    """Mock request class for GET request"""

    method = "GET"


@dataclass
class PutMockRequest:
    """Mock request class for PUT request"""

    method = "PUT"


@dataclass
class DeleteMockRequest:
    """Mock request class for DELETE request"""

    method = "DELETE"


@dataclass
class PostMockEmptyRequest:
    """Mock POST request with empty body"""

    method = "POST"

    def get_json(self):
        """
        Retrieves a JSON object.

        Returns:
            None: This method currently does not return any JSON object.
        """
        return None


@dataclass
class PostMockNotAllFieldsRequest:
    """Mock POST request missing some required fields"""

    method = "POST"

    def get_json(self):
        """
        Returns a dictionary containing user information.

        Returns:
            dict: A dictionary with the following keys:
                - email (str): The email address of the user.
                - fullName (str): The full name of the user.
                Note: The 'role' key is currently missing in the returned dictionary.
        """
        return {
            "email": "deepeshkalurs@gmail.com",
            "fullName": "Deepesh Kalura",
            # Missing role
        }


@dataclass
class PostMockAllFieldsButInvalidRoleRequest:
    """Mock POST request with all fields but invalid role"""

    method = "POST"

    def get_json(self):
        """
        Returns a dictionary containing user information.

        The dictionary includes the following keys:
        - "email": The email address of the user.
        - "fullName": The full name of the user.
        - "role": The role of the user.

        Returns:
            dict: A dictionary with user details.
        """
        return {
            "email": "deepeshkalurs@gmail.com",
            "fullName": "Deepesh Kalura",
            "role": "invalid_role",
        }


@dataclass
class PostMockAllFieldsRequest:
    """Mock POST request with all required valid fields"""

    method = "POST"

    def get_json(self):
        """
        Retrieves a JSON object containing user information.

        Returns:
            dict: A dictionary with the following keys:
                - "email" (str): The email address of the user.
                - "fullName" (str): The full name of the user.
                - "role" (str): The role of the user.
        """
        return {
            "email": "deepeshkalurs@gmail.com",
            "fullName": "Deepesh Kalura",
            "role": "admin",
        }


# ---------- Parametrized Tests for create_new_user_by_admin ----------
@pytest.mark.asyncio
@pytest.mark.parametrize(
    "req, expected, status_code",
    [
        (GetMockRequest(), "Method not allowed", 405),
        (PutMockRequest(), "Method not allowed", 405),
        (DeleteMockRequest(), "Method not allowed", 405),
        (PostMockEmptyRequest(), "Invalid request body", 400),
        (PostMockNotAllFieldsRequest(), "Missing required fields", 400),
        (
            PostMockAllFieldsButInvalidRoleRequest(),
            "Invalid role. Must be one of: ['admin', 'teacher', 'student', 'bot']",
            400,
        ),
        (PostMockAllFieldsRequest(), "User created successfully with ID: 123", 201),
    ],
)
async def test_create_new_user_by_admin(req, expected, status_code, monkeypatch):
    """Test that create_new_user_by_admin handles various request scenarios correctly"""

    def mock_create_user(*args, **kwargs):
        """
        Mock function to simulate the creation of a user.

        This function returns a mock client object with a predefined `uid` attribute.

        Args:
            *args: Variable length argument list.
            **kwargs: Arbitrary keyword arguments.

        Returns:
            Client: A mock client object with a `uid` attribute set to "123".
        """
        _ = args, kwargs

        @dataclass
        class Client:
            """Mock client class"""

            uid = "123"

        return Client()

    def mock_set_custom_claims(*args, **kwargs):
        """
        Mock function to simulate setting custom claims.

        This function is a placeholder and does not perform any actual operations.
        It accepts any arguments and keyword arguments but always returns None.

        Args:
            *args: Variable length argument list.
            **kwargs: Arbitrary keyword arguments.

        Returns:
            None
        """
        _ = args, kwargs

    async def mock_send_welcome_email(*args, **kwargs):
        """
        Mock function to simulate sending a welcome email.

        This function is an asynchronous placeholder that takes any arguments
        and keyword arguments but does not perform any operations.

        Returns:
            None: This function always returns None.
        """
        _ = args, kwargs
        return None

    monkeypatch.setattr("firebase_admin.auth.create_user", mock_create_user)
    monkeypatch.setattr(
        "firebase_admin.auth.set_custom_user_claims", mock_set_custom_claims
    )
    monkeypatch.setattr(
        "email_service.EmailService.send_welcome_email", mock_send_welcome_email
    )

    result = create_new_user_by_admin(req)
    assert result.status_code == status_code
    response_data = result.get_json()
    assert response_data["message"] == expected
