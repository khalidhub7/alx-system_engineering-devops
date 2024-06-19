#!/usr/bin/python3
"""Gather data from an API"""
import requests


def number_of_subscribers(subreddit):
    """
    Queries the Reddit API and returns the number of subscribers
    for a given subreddit. If an invalid subreddit is given,
    the function returns 0.
    """
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
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

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        print(number_of_subscribers(sys.argv[1]))
    else:
        print("Usage: {} <subreddit>".format(sys.argv[0]))
