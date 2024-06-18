#!/usr/bin/python3
"""Gather subscribers from API"""
import requests


def top_ten(subreddit):
    """Returns the number of subscribers"""
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    headers = {'User-Agent': 'khalid_loug'}
    response = requests.get(url, headers=headers, allow_redirects=True)
    if response.status_code == 200:
        data = response.json().get('data')
        subs = data.get('title')
        print(subs)
    else:
        print(None)
