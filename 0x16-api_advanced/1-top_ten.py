#!/usr/bin/python3
"""Gather title from api"""
import requests


def top_ten(subreddit):
    """return top 10 titles"""
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    headers = {'User-Agent': 'khalid_loug'}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        data = response.json().get('data')
        max = 1
        for i in data['children']:
            print(i['data']['title'])
            max += 1
            if max == 11:
                break
    else:
        print(None)
