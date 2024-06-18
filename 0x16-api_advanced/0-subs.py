#!/usr/bin/python3
""" gather subscribers from api """
import requests


def number_of_subscribers(subreddit=None):
    """ subscribers """
    if subreddit:
        resp = requests.get('https://www.reddit.com/r/{}/about.json',
                            headers={'User-Agent': 'Mozilla/5.0'}
                            .format(subreddit))
        if resp.status_code == 200:
            data_returned = resp.json()
            return data_returned['data']['subscribers']
        else:
            return 0
    else:
        return 0
