#!/usr/bin/env bash
#
# assignment_03-solved.sh - Assignment #03 solution
#
# Author:       Otávio Souza
#
# ------------------------------------------
# Apply the good practices taught in the module
# to the source script assignment_03-source.sh.
#
#
# ------------------------------------------
# Change log:
#   v1.0 31/08/2021, Otávio Souza:
#       - Code formatting
#
#   v1.1 31/08/2021, Otávio Souza:
#       - Adding shellcheck directive
#
# ------------------------------------------
# Tested on:
#   bash 5.1.0
#
# ------------------------------------------

START=0
UNTIL=100

[ $START -ge $UNTIL ] && exit 1

for i in $(seq $START $UNTIL)
do
    # shellcheck disable=SC2034  # Unused variables left for readability
    for j in $(seq "$i" $UNTIL)
    do
        printf "*"
    done
    printf "\n"
done