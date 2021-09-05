#!/usr/bin/env bash
#
# users.sh - System to manage users
#
# Author:       Souza, Otávio
# Maintainer:   Souza, Otávio
# GitHub:       https://github.com/otaviosouza
#
# -----------------------------------------------------------
# This script do all user management functions as create,
# delete and update.
#
# Example:
#   $ source users.sh
#   $ UserList
#
# This script uses ShellCheck - https://github.com/koalaman/shellcheck
# -----------------------------------------------------------
# Changelog:
#   v1.0 05/09/2021, Otávio Souza:
#       - Error handling
#       - ListUsers function
#
# -----------------------------------------------------------
# Tested on:
#   bash 5.1.0
# -----------------------------------------------------------
# Thanks:
#   Mateus Müller (https://bit.ly/3BYPyiT) - For dedicating
#   your personal time to this course.
#
# -----------------------------------------------------------

DB_FILE="users_db.txt"

RED="\033[1;31m"
GREEN="\033[32m"
NC="\033[0m"

[ ! -e "$DB_FILE" ] && echo -e "${RED}ERROR. The database does not exist.${NC}" && exit 1
[ ! -r "$DB_FILE" ] && echo -e "${RED}ERROR. Read permission denied.${NC}" && exit 1
[ ! -w "$DB_FILE" ] && echo -e "${RED}ERROR. Write permission denied.${NC}" && exit 1

ShowUser(){
    local id
    local name
    local email
    id="$(echo "$1" | cut -d : -f 1)"
    name="$(echo "$1" | cut -d : -f 2)"
    email="$(echo "$1" | cut -d : -f 3)"

    echo -e "${GREEN}ID: ${RED}$id${NC}"
    echo -e "${GREEN}Name: ${RED}$name${NC}"
    echo -e "${GREEN}E-mail: ${RED}$email${NC}"
}

ListUsers(){
    while read -r line
    do
        [ "$(echo "$line" | cut -c1)" = "#" ] && continue
        [ ! "$line" ] && continue
        ShowUser "$line"
    done < "$DB_FILE"
}