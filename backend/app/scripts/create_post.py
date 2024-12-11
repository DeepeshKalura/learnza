import traceback
from typing import List, Optional
import firebase_admin.firestore
import requests
import random
from googletrans import Translator
import os
from datetime import datetime
from dotenv import load_dotenv, find_dotenv
from pydantic import BaseModel, Field
import requests
import uuid
import firebase_admin
from firebase_admin import credentials, firestore, auth, storage
from functools import lru_cache


class FirebaseService:
    _instance = None

    def __init__(self):
        if not firebase_admin._apps:
            cred = credentials.Certificate("serviceAccountKey.json")
            firebase_admin.initialize_app(
                cred, {"storageBucket": "learnza.firebasestorage.app"}
            )
        self.db = firestore.client()
        self.auth = auth
        self.storage = storage.bucket()

    @property
    def firestore(self):
        return self.db

    @property
    def authentication(self):
        return self.auth

    @property
    def cloud_storage(self):
        return self.storage


# To make it singlethon instance
@lru_cache()
def get_firebase_service() -> FirebaseService:
    return FirebaseService()


# Dependency
def get_firestore():
    service = get_firebase_service()
    return service.firestore


def get_auth():
    service = get_firebase_service()
    return service.authentication


def get_storage():
    service = get_firebase_service()
    return service.cloud_storage


class PostEngagementMetrics(BaseModel):
    totalViews: int = Field(default=0)
    uniqueViews: int = Field(default=0)
    likes: int = Field(default=0)
    dislikes: int = Field(default=0)
    totalComments: int = Field(default=0)
    activeDiscussions: int = Field(default=0)
    topLevelComments: int = Field(default=0)
    nestedComments: int = Field(default=0)
    shares: int = Field(default=0)
    engagementRate: float = Field(default=0.0)
    reachRate: float = Field(default=0.0)
    uniqueInteractors: int = Field(default=0)
    averageReadTime: float = Field(default=0.0)
    scrollDepth: int = Field(default=0)

    class Config:
        from_attributes = True
        
class PostModel(BaseModel):
    id: str
    title: str
    content: str
    authorId: str
    thumbnailUrl: Optional[str] = None
    createdAt: str
    updatedAt: str
    comments: List[str] = Field(default_factory=list)  
    isFeatured: bool = False  
    isPinned: bool = False     
    visibility: str = "public" 
    engagementMetrics: PostEngagementMetrics = Field(default_factory=PostEngagementMetrics)  

    class Config:
        from_attributes = True
        use_enum_values = True




# load the secrets
load_dotenv(find_dotenv())


def create_github_issue(title, body=None, assignees=None, labels=None):
    """
    Create a GitHub issue in the specified repository.
    Args:
        title (str): The title of the GitHub issue.
        body (str, optional): The body content of the GitHub issue. Defaults to None.
        assignees (list, optional): A list of GitHub usernames to assign to the issue. Defaults to None.
        labels (list, optional): A list of labels to assign to the issue. Defaults to None.
    Returns:
        dict or None: The JSON response from the GitHub API if the issue is created successfully,
                      otherwise None.
    """
    access_token = os.getenv("GITHUB_ACCESS_TOKEN")
    owner = "DeepeshKalura"
    repo = "learnza"
    url = f"https://api.github.com/repos/{owner}/{repo}/issues"

    headers = {
        "Authorization": f"Bearer {access_token}",
        "Accept": "application/vnd.github.v3+json",
    }

    payload = {"title": title}

    if body:
        payload["body"] = body
    if assignees:
        payload["assignees"] = assignees
    if labels:
        payload["labels"] = labels

    try:
        response = requests.post(url, json=payload, headers=headers)

        if response.status_code == 201:
            print(f"Issue '{title}' created successfully!")
            return response.json()
        else:
            print(f"Failed to create issue. Status code: {response.status_code}")
            print(f"Response: {response.text}")
            return None

    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None



def error_logging_function(title: str, e: Exception) -> None:
    """
    Logs an error by creating a GitHub issue with detailed information.
    Args:
        title ( String ): The title for github issue
        e (Exception): The exception that was raised.
    The function gathers the following information:
        - Error message
        - Stack trace
        - Current timestamp
        - Device information
        - Storage information
        - Network information
    This information is then used to create a GitHub issue with the title "Error fetching quote",
    and the detailed error information in the body. The issue is labeled as "bug" and assigned to "DeepeshKalura".
    """
    body = f"An error occurred while fetching the quote:\n\n```\n{e}\n```"
    body += f"\n\nStack Trace:\n```\n{traceback.format_exc()}\n```"
    body += f"\n\nTime: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}"
    body += f"\n\nDevice Info: {os.uname()}"

    # Additional device info
    storage_info = os.popen("df -h").read()
    network_info = os.popen("ifconfig").read()

    body += f"\n\nStorage Info:\n```\n{storage_info}\n```"
    body += f"\n\nNetwork Info:\n```\n{network_info}\n```"

    create_github_issue(
        title=title, body=body, labels=["bug"], assignees=["DeepeshKalura"]
    )


QUOTE_API = "https://zenquotes.io/api/random"
FACTS_API = "https://uselessfacts.jsph.pl/random.json?language=en"


# Google Translate Setup
translator = Translator()


def fetch_random_quote():
    """
    Fetches a random quote from the QUOTE_API.
    This function makes a GET request to the QUOTE_API to retrieve a random quote.
    If the request is successful (status code 200), it returns the quote in the format
    "quote - author". If an error occurs during the request, it prints an error message
    and creates a GitHub issue with detailed error information including stack trace,
    time of occurrence, device info, storage info, and network info.
    Returns:
        str: A string containing the quote and author if the request is successful.
        None: If an error occurs during the request.
    """
    try:
        response = requests.get(QUOTE_API)
        if response.status_code == 200:
            quote_data = response.json()[0]
            return f"{quote_data['q']} - {quote_data['a']}"
    except Exception as e:
        error_logging_function(
            title="Failure of Cronjob for TU university lernza application fetching random quoute fail",
            e=e,
        )
    return None


def fetch_random_fact():
    try:
        response = requests.get(FACTS_API)
        if response.status_code == 200:
            fact_data = response.json()
            return fact_data["text"]
    except Exception as e:
        print(f"Error fetching fact: {e}")
    return None


IMAGE_API = "https://api.unsplash.com/photos/random"
UNSPLASH_ACCESS_KEY = os.getenv("UNSPLASH_ACCESS_KEY")


def fetch_random_image():
    try:
        headers = {"Authorization": f"Client-ID {UNSPLASH_ACCESS_KEY}"}
        response = requests.get(IMAGE_API, headers=headers)
        if response.status_code == 200:
            image_data = response.json()
            return image_data["urls"]["regular"]
    except Exception as e:
        error_logging_function(
            title="Failure of Cronjob for TU university lernza application fetching image fail",
            e=e,
        )
    return None

# TODO:  It has some error i create [PR#21] for enhachement 
def translate_to_nepali(text):
    try:
        translated = translator.translate(text, dest="ne")
        return translated.text
    except Exception as e:
        error_logging_function(
            title="Failure of Cronjob for TU university lernza application translating to Nepali",
            e=e,
        )
    return text


def create_post():

    image_url = fetch_random_image()
    post: PostModel | None

    if True:
        content = fetch_random_quote()
        if content is None:
            raise Exception("Failed to fetch content for the post")
        post = PostModel(
            title="Fun Fact Bot Present",
            id=str(uuid.uuid1()),
            thumbnailUrl=image_url,
            authorId="703b4ed3-04da-4fb8-9304-6ed4381307db",
            content=content,
            createdAt=datetime.now().isoformat(),
            updatedAt=datetime.now().isoformat(),
        )
    # TODO: Implement 30 different bots which can do different types of data[PR#24]
    # else:
    #     content = fetch_random_fact()
    #     if content is None:
    #         raise Exception("Failed to fetch content for the post")

    return post


def save_post(post: PostModel):
    database = get_firestore()

    post_ref = database.collection("posts").document(post.id)
    try:
        # Step 1: Create the post document first
        post_ref.set(post.model_dump())
        
        # Step 2: Update global post metrics
        global_post_metrics_ref = database.collection("global-post-metrics").document("LwOyb4Ffxn9Kj1122mqg")
        metrics_doc = global_post_metrics_ref.get()
        
        if not metrics_doc.exists:
            raise Exception("Global post metrics document does not exist")
        
        # Retrieve current metrics
        current_metrics = metrics_doc.to_dict()
        if (current_metrics == None) :
            raise Exception("Global post metrics document does not exist")
        updated_metrics = {
            "totalPosts": current_metrics.get("totalPosts", 0) + 1,
            "activePosts": current_metrics.get("activePosts", 0) + 1
        }
        
        # Update global metrics
        global_post_metrics_ref.update(updated_metrics)
        
        print("Post saved successfully")
        
    except Exception as e:
        # Rollback mechanism
        try:
            # Delete the post if global metrics update fails
            post_ref.delete()
        except Exception as delete_error:
            print(f"Error during rollback: {delete_error}")
        
        # Re-raise the original exception
        raise Exception(f"Failed to save post: {str(e)}")



# TODO: In future we need to use the transaction with google auth cloud if we need [PR#23]
# def save_post(post: PostModel):
#     database = get_firestore()

#     global_post_metrics_ref = database.collection("global-post-metrics").document(
#         "FdCccnSXO37fnGLPT7Ca"
#     )


#     post_ref = database.collection("posts").document(post.id)


   
#     def update_metrics(transaction, global_post_metrics_ref):
#         metrics_doc = transaction.get(global_post_metrics_ref)
#         if not metrics_doc.exists:
#             raise Exception("Global post metrics document does not exist")

#         new_metrics_data = metrics_doc.to_dict()
#         new_metrics_data["totalPosts"] = new_metrics_data.get("totalPosts", 0) + 1
#         new_metrics_data["activePosts"] = new_metrics_data.get("activePosts", 0) + 1

#         transaction.set(global_post_metrics_ref, new_metrics_data)
#         transaction.set(
#             post_ref, post.model_dump()
#         )
#     try:
#         transaction  = database.transaction()
#         update_metrics(transaction, global_post_metrics_ref, )
#         print("Transaction completed")
#     except Exception as e:
            # error_logging_function(title="Failure of Cronjob for TU university lernza application translating failed", e=e)
#         print(f"Failure of Cronjob for TU university lernza application transaction failed {e}")



if __name__ == "__main__":
    post = create_post()
    if post:
        print(f"Generated Post:\n{post.model_dump()}\n")

        save_post(post)

    else:
        print("Failed to generate post.")
