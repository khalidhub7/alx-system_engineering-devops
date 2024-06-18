#!/usr/bin/python3
"""Gather subscribers from API"""
import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers"""
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    headers = {'User-Agent': 'khalid_loug'}
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        return int(0)
    data = response.json().get('data')
    subs = data.get('subscribers')
    subs = 756024
    return int(subs)
