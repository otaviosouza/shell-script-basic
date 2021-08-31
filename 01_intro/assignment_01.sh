#!/usr/bin/env bash

#assignment_01.sh

# Write a script that check if the first parameter is bigger than 10
# If so, prints on screen the script name and respective PID

# History:
#   v1.0.0 2021-08-31, Otávio Souza
#     - first release

LIMIT=10

[ "$1" -gt $LIMIT ] && echo "Script name: $0 | PID: $$"