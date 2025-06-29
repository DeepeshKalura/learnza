import firebase_admin
from firebase_admin import credentials, firestore
import os

# --- Helper Function to Generate Keywords ---
def generate_search_keywords(text: str) -> list:
    """
    Generate all unique lowercase substrings from each part of the input text.
    
    Parameters:
        text (str): The input string, typically a full name.
    
    Returns:
        list: A list of unique substrings derived from each part of the input text. Returns an empty list if the input is empty or None.
    """
    if not text:
        return []
    
    keywords = set()
    lowercase_text = text.lower()
    
    # Split the name into parts (e.g., "John Doe" -> ["john", "doe"])
    name_parts = lowercase_text.split()

    for part in name_parts:
        if part:
            for i in range(len(part)):
                for j in range(i + 1, len(part) + 1):
                    keywords.add(part[i:j])
                    
    return list(keywords)

def main():
    """
    Scans all Firestore user documents and adds a 'searchableKeywords' field with generated keyword substrings for users who have a 'fullName' but lack the 'searchableKeywords' field.
    
    Initializes Firebase using a local service account key, processes users in batches to comply with Firestore limits, and prints progress and summary information. Handles missing credentials and Firestore errors gracefully with informative output.
    """
    print("--- Firestore User Update Script ---")

    # --- Firebase Initialization ---
    try:
        # Get the path to the service account key file
        # Assumes the key file is in the same directory as the script
        script_dir = os.path.dirname(os.path.abspath(__file__))
        key_path = os.path.join(script_dir, "serviceAccountKey.json")

        if not os.path.exists(key_path):
            print(f"❌ ERROR: Service account key not found at '{key_path}'")
            print("Please download it from your Firebase project settings and place it in the same directory as this script.")
            return

        cred = credentials.Certificate(key_path)
        firebase_admin.initialize_app(cred)
        db = firestore.client()
        print("✅ Firebase initialized successfully.")
    except Exception as e:
        print(f"❌ ERROR: Failed to initialize Firebase: {e}")
        return

    # --- Data Update Logic ---
    try:
        users_ref = db.collection('users')
        docs = users_ref.stream() # Use stream() for memory efficiency with large collections

        batch = db.batch()
        updated_count = 0
        total_count = 0

        print("\nScanning 'users' collection for documents to update...")

        for doc in docs:
            total_count += 1
            user_data = doc.to_dict()
            
            # Check if the document needs updating
            full_name = user_data.get('fullName')
            if full_name and 'searchableKeywords' not in user_data:
                # Generate keywords and add the update to the batch
                keywords = generate_search_keywords(full_name)
                batch.update(doc.reference, {'searchableKeywords': keywords})
                updated_count += 1
                print(f"  - Queued update for user: {doc.id} (Name: {full_name})")

                # Firestore batches are limited to 500 operations.
                # Commit the batch if it reaches the limit and start a new one.
                if updated_count % 499 == 0:
                    print(f"\nCommitting batch of {updated_count} updates...")
                    batch.commit()
                    batch = db.batch() # Start a new batch
                    print("✅ Batch committed.")


        # Commit any remaining updates in the last batch
        if updated_count > 0:
            print(f"\nCommitting final batch of updates...")
            batch.commit()
            print("✅ Final batch committed.")
        
        print("\n--- Summary ---")
        print(f"Total users scanned: {total_count}")
        print(f"Users updated: {updated_count}")
        if total_count > 0 and updated_count == 0:
            print("It looks like all users were already up-to-date!")
        print("--- Script finished ---")

    except Exception as e:
        print(f"❌ An error occurred during the Firestore update process: {e}")

if __name__ == "__main__":
    main()