#!/usr/bin/python3
"""
Gather subscribers from API
"""

import requests


def number_of_subscribers(subreddit=None):
    """
    Returns the number of subscribers
    """
    if subreddit:
        url = f'https://www.reddit.com/r/{subreddit}/about.json'
        headers = {'User-Agent': 'MyBot/1.0'}
        response = requests.get(url, headers=headers)
        
        if response.status_code == 200:
            data_returned = response.json()
            return data_returned['data']['subscribers']
        else:
            return 0
    return 0
