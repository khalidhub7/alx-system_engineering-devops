#!/usr/bin/python3
"""number of subs"""
import requests


def number_of_subscribers(subreddit):
    """
    Reddit API to get the number of subscribers
    """
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {
        'User-Agent': 'MyRedditApp/1.0 (by /u/khalid)'
    }
    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        if response.status_code == 302:
            return 0
        elif response.status_code == 403:
            return 0
        elif response.status_code != 200:
            return 0
        data = response.json().get('data', {})
        return data.get('subscribers', 0)
    except requests.RequestException:
        return 0
