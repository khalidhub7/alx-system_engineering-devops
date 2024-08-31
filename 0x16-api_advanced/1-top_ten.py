#!/usr/bin/python3
"""Fetch the titles"""
import requests


def top_ten(subreddit):
    """10 hot posts"""
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {
        'User-Agent': 'MyRedditApp/1.0 (by /u/khalid)'
    }
    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        if response.status_code == 302:
            print(None)
            return
        elif response.status_code == 403:
            print(None)
            return
        elif response.status_code != 200:
            print(None)
            return
        data = response.json().get('data', {})
        children = data.get('children', [])
        for i in range(min(10, len(children))):
            print(children[i].get('data', {}).get('title', ''))
    except requests.RequestException:
        print(None)
