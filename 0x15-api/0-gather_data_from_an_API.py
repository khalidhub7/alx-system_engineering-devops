#!/usr/bin/python3
""" return info about TODO list progress.
of employee by id """

from sys import argv
import requests

if __name__ == '__main__':
    id = int(argv[1])
    url = 'https://jsonplaceholder.typicode.com/users'
    data = requests.get('{}/{}'.format(url, id)).json()
    todo = requests.get('{}/{}/todos'.format(url, id)).json()

    tasks = 0
    done = 0
    title = []
    for i in todo:
        if i['completed'] == 'true':
            done += 1
            title.append(i['title'])
        tasks += 1
    print(
        'Employee {} is done with tasks({}/{}):'.format(data['name'], done, tasks))
    for i in title:
        print(f'{'\t'}{i}')
