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

        if response.status_code == 302:  # Redirect
            return 0
        elif response.status_code == 403:  # Forbidden
            return 0
        elif response.status_code != 200:  # Other errors
            return 0

        data = response.json().get('data', {})
        return data.get('subscribers', 0)

    except requests.RequestException:
        return 0

