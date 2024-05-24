#!/usr/bin/python3
""" export data in the JSON format. """
import json
import requests

if __name__ == '__main__':
    url = 'https://jsonplaceholder.typicode.com/users'
    data = requests.get(url).json()

    num_of_employee = 0
    for x in data:
        num_of_employee += 1

    all = []
    for i in range(num_of_employee + 1)[1:]:
        todos = requests.get('{}/{}/todos'.format(url, i)).json()
        all.append(todos)
    cc = []
    for j in all:
        for m in j:
            """ this line is to get username """
            user = next(user for user in data if user['id'] == m['userId'])

            cc.append({"task": m['title'],
                       "completed": m['completed'],
                       "username": data['username']})
    content = {}
    for h in range(num_of_employee + 1)[1:]:
        content[str(h)] = [task for task in cc if task['username'] == next(
            user for user in data if user['id'] == h)['username']]
    file = 'todo_all_employees.json'

    with open(file, 'w') as f:
        json.dump(content, f)
