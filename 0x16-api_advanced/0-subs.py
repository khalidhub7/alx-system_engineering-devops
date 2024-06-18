#!/usr/bin/python3
"""
Gather subscribers from Reddit API.
"""

import requests


def number_of_subscribers(subreddit=None):
    """
    Returns the number of subscribers for a given subreddit.
    If subreddit is invalid or the request fails, returns 0.
    """
    if subreddit:
        url = f'https://www.reddit.com/r/{subreddit}/about.json'
        headers = {'User-Agent': 'MyBot/1.0'}
        response = requests.get(url, headers=headers)
        
        if response.status_code == 200:
            data_returned = response.json()
            return data_returned['data']['subscribers']
        else:
            print(f"Failed to fetch data for subreddit '{subreddit}': HTTP {response.status_code}")
    return 0

if __name__ == '__main__':
    subreddit_name = input("Enter the subreddit name: ")
    print(f"Number of subscribers in r/{subreddit_name}: {number_of_subscribers(subreddit_name)}")
