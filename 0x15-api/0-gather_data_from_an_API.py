#!/usr/bin/python3
"""Return info about todo list progress of employee by id."""

import requests
from sys import argv
if __name__ == '__main__':
    id = int(argv[1])
    url = 'https://jsonplaceholder.typicode.com/users'
    data = requests.get('{}/{}'.format(url, id)).json()
    todo = requests.get('{}/{}/todos'.format(url, id)).json()

    tasks = 0
    done = 0
    title = []
    for i in todo:
        if i.get('completed'):
            done += 1
            title.append(i.get('title'))
        tasks += 1

    print('Employee {} is done with tasks({}/{}):`\
          '.format(data.get('name'),
                   done,
                   tasks))

    for i in title:
        print('\t {}'.format(i))
