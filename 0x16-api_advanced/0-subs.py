#!/usr/bin/python3
""" gater data from an api """
import requests


def number_of_subscribers(subreddit):
    responce = requests.get("https://www.reddit.com/r/{}/about.json"
                            .format(subreddit), headers={
                                "User-Agent": "khalid_log"
                            }, allow_redirects=False)
    if responce.status_code == int(200):
        data = responce.json()
        return int(data['data']["subscribers"])
    elif responce.status_code == int(404):
        return int(0)
