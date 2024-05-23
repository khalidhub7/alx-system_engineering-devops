#!/usr/bin/python3
"""Return info about todo list progress of employee by id."""

import requests
from sys import argv

if __name__ == '__main__':
    employee_id = int(argv[1])
    url = 'https://jsonplaceholder.typicode.com/users'
    user_data = requests.get('{}/{}'.format(url, employee_id)).json()
    todo_data = requests.get('{}/{}/todos'.format(url, employee_id)).json()

    total_tasks = 0
    completed_tasks = 0
    completed_titles = []
    
    for task in todo_data:
        if task.get('completed'):
            completed_tasks += 1
            completed_titles.append(task.get('title'))
        total_tasks += 1

    print('Employee {} is done with tasks({}/{}):'.format(user_data.get('name'), completed_tasks, total_tasks))
    for title in completed_titles:
        print('\t {}'.format(title))

