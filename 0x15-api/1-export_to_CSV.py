#!/usr/bin/python3
"""Return info about todo list of an employee by ID
but in CSV format"""

import requests
from sys import argv

if __name__ == '__main__':
    id = int(argv[1])
    url = 'https://jsonplaceholder.typicode.com/users/{}'.format(id)
    data = requests.get(url).json()
    todo_list = requests.get('{}/todos'.format(url)).json()

    file = '{}.csv'.format(id)
    csv_list = []
    for i in todo_list:
        csv_list.append("'{}','{}','{}','{}'".format(
            i.get('userId'), data['name'], i.get('completed'), i.get('title')))
    csv_content = ""
    for j in csv_list:
        csv_content += j
        if j != csv_list[-1]:
            csv_content += '\n'
    with open(file, 'w') as f:
        f.write(csv_content)
