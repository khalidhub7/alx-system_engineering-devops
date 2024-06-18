#!/usr/bin/python3
"""Gather subscribers from API"""
import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers"""
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {'User-Agent': 'khalid_loug'}
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 200:
        data_returned = response.json()
        return data_returned['data']['subscribers']
    if response.status_code != 200:
        return 0
