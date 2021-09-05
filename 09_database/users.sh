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