from datetime import datetime
import os
import uuid
import requests

from create_post import PostModel, fetch_random_image, get_firestore


FACTS_API = "https://uselessfacts.jsph.pl/random.json?language=en"
NINJA_FACT_API = "https://api.api-ninjas.com/v1/facts"

def fetch_random_fact()-> str|None:
    try:
        response = requests.get(FACTS_API)
        if response.status_code == 200:
            fact_data = response.json()
            return fact_data["text"]
    except Exception as e:
        print(f"Error fetching fact: {e}")
    return None


def ninja_fetch_random_fact()->str|None:

    try : 
        response = requests.get(NINJA_FACT_API, headers={'X-Api-Key': os.getenv("NINJA_API_KEY")})
        if response.status_code == requests.codes.ok:
            return response.text
        else:
            print("Error:", response.status_code, response.text)
    except Exception as e: 
        print(f"Error fetching fact: {e}")

    return None


def create_post():

    image_url = fetch_random_image()
    post: PostModel | None

    if True:
        content = fetch_random_fact()
        if content is None:
            raise Exception("Failed to fetch content for the post")
        post = PostModel(
            title="Fact Bot Present",
            id=str(uuid.uuid1()),
            thumbnailUrl=image_url,
            authorId="7ad5b901-a4ee-4c48-a891-e2466dabcf98",
            content=content,
            createdAt=datetime.now().isoformat(),
            updatedAt=datetime.now().isoformat(),
        )


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

if __name__ == "__main__":
    post = create_post()
    if post:
        print(f"Generated Post:\n{post.model_dump()}\n")

        save_post(post)

    else:
        print("Failed to generate post.")