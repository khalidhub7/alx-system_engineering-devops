#!/usr/bin/python3
"""
Fetch the number of subscribers for a specified subreddit from Reddit.
"""

import requests


def number_of_subscribers(subreddit):
    """
    Queries the Reddit API to get the number of subscribers for a given subreddit.
    Returns 0 if the subreddit is invalid or if there's an error.
    """
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {
        'User-Agent': 'MyRedditApp/1.0 (by /u/Alogyn)'
    }

    try:
        response = requests.get(url, headers=headers, allow_redirects=False)

        # Check for redirect and forbidden status
        if response.status_code == 302:  # Redirect, likely invalid subreddit
            return 0
        elif response.status_code == 403:  # Forbidden, possibly due to rate limiting or blocked access
            return 0
        elif response.status_code != 200:  # Other unexpected status codes
            return 0

        # Extract the number of subscribers
        data = response.json().get('data', {})
        return data.get('subscribers', 0)

    except requests.RequestException:
        # Handle network-related errors
        return 0
