"""
Utility functions for the application.
"""

import random


def create_random_avatar():
    """
    Generates a random avatar URL using the DiceBear Adventurer API.

    The function selects a random name from a predefined list as a seed and constructs
    a URL that will generate a unique avatar using the DiceBear Adventurer API.

    Returns:
        str: A URL string pointing to a randomly generated SVG avatar with the following parameters:
            - seed: Random name from predefined list
            - scale: 110
            - backgroundColor: transparent
    """
    seed_list = [
        "Jack",
        "George",
        "Kimberly",
        "Katherine",
        "Eliza",
        "Emery",
        "Christian",
        "Jade",
        "Liam",
        "Aiden",
        "Adrian",
        "Christopher",
        "Leah",
        "Easton",
        "Jameson",
        "Jude",
        "Destiny",
        "Kingston",
        "Liliana",
        "Aidan",
    ]
    seed = random.choice(seed_list)
    base_url = "https://api.dicebear.com/9.x/adventurer/svg"
    scale = 110

    url = f"{base_url}?seed={seed}&scale={scale}&backgroundColor=transparent"
    return url
