#!/usr/bin/python3
"""Gather subscribers from API"""
import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers"""
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {'User-Agent': 'request'}
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        return 0
    data = response.json().get('data')
    subs = data.get('subscribers')
    return subs
