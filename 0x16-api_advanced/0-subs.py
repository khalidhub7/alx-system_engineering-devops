#!/usr/bin/python3
"""Gather data from an API"""
import requests

def number_of_subscribers(subreddit):
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {
        "User-Agent": "khalid_log/0.0.1 (by u/your_reddit_username)"
    }
    
    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        if response.status_code == 200:
            data = response.json()
            return int(data['data']['subscribers'])
        else:
            return 0
    except requests.RequestException:
        return 0
