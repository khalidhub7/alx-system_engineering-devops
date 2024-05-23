#!/usr/bin/python3
""" export data in the JSON format"""
import json
import requests
from sys import argv

if __name__ == '__main__':
    id = int(argv[1])
    url = 'https://jsonplaceholder.typicode.com/users/'
    data = requests.get('{}/{}'.format(url, id)).json()
    todo_list = requests.get('{}/{}/todos'.format(url, id)).json()
    file = '{}.json'.format(id)

    cc = []
    for i in todo_list:
        cc.append({"task": i['title'],
                   "completed": i['completed'],
                   "username": data['username']})

    content = {str(id): cc}
    with open(file, 'w') as f:
        json.dump(content, f)
