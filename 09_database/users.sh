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
#       - List users on database
#       - Implement CRUD for user
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
TEMP=temp.$$

SEP=":"

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
    id="$(echo "$1" | cut -d $SEP -f 1)"
    name="$(echo "$1" | cut -d $SEP -f 2)"
    email="$(echo "$1" | cut -d $SEP -f 3)"

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

ValidateUser(){
    grep -i -q "$1$SEP" "$DB_FILE" # -i : ignore case -q : quiet
}

CreateUser(){
    local name
    name="$(echo "$1" | cut -d $SEP -f 2)"

    if ValidateUser "$name"; then
        echo -e "${RED}ERROR. User $name already exists.${NC}"
    else
        echo "$*" >> "$DB_FILE"
        echo -e "${GREEN}User $name created with success.${NC}"
    fi
    SortUsers
}

DeleteUser(){
    ValidateUser "$1" || return

    grep -i -v "$1$SEP" "$DB_FILE" > "$TEMP"
    mv "$TEMP" "$DB_FILE"

    echo -e "${GREEN}User deleted with success.${NC}"
    SortUsers
}

SortUsers(){
    sort "$DB_FILE" > "$TEMP"
    mv "$TEMP" "$DB_FILE"
}