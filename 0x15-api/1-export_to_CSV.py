#!/usr/bin/python3
"""Return info about todo list of an employee by ID
but in CSV format"""

import csv
import requests
from sys import argv

if __name__ == '__main__':
    id = int(argv[1])
    url = 'https://jsonplaceholder.typicode.com/users/{}'.format(id)
    data = requests.get(url).json()
    todo_list = requests.get('{}/todos'.format(url)).json()

    file = '{}.csv'.format(id)
    csv_list = []

    with open(file, 'w', newline='') as f:
        writing = csv.writer(f, quoting=csv.QUOTE_ALL)
        for i in todo_list:
            writing.writerow([i['userId'], data['username'],
                             i['completed'], i['title']])
