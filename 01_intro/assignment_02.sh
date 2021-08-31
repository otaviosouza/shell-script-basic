#!/usr/bin/env bash

#assignment_02.sh

# Write a script that counts from 0 up to 10. With every interaction,
# it checks if the number is divisible by 2. If so, prints on screen
# a message confirming

# History:
#   v1.0.0 2021-08-31, Otávio Souza
#     - first release

N_COUNTER=0
while [[ $N_COUNTER -le 10 ]]; do
    if test $((N_COUNTER % 2))  -eq 0
    then
        echo "$N_COUNTER is divisible by 2."
    fi
    N_COUNTER=$((N_COUNTER+1))
done