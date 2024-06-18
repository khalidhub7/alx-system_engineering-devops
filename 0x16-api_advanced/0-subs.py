#!/usr/bin/python3
""" gather subscribers from api """
import requests


def number_of_subscribers(subreddit=None):
    """ subscribers """
    resp = requests.get('https://www.reddit.com/r/{}/about.json'
                        .format(subreddit))
    if resp.status_code == 200:
        data_returned = resp.json()
        return data_returned['data']['subscribers']
    else:
        return 0
