#!/usr/bin/env bash
#
# list_users.sh - Extract users from /etc/passwd
#
# Author:       Otávio Souza
#
# -----------------------------------------------
# Script about flags on Matthew Muller's Course
# It will extract the users from /etc/passwd.
# The user can sort alphabetically, or capitalize.
#
# Example:
#   $ ./list_users.sh -s -m
#   The output will be sorted alphabetically and
#   capitalized.
#
# This script uses ShellCheck - https://github.com/koalaman/shellcheck
# -----------------------------------------------
# Change log:
#   v1.0 01/09/2021, Otávio Souza:
#       - Initial script with IF
#       - Add -s, -h & -v
#
#   v1.1 01/09/2021, Otávio Souza:
#       - Add basename
#       - Change IF to CASE
#
#   v1.2 01/09/2021, Otávio Souza:
#       - Add FLAGS for sort and capitalize
#
# ------------------------------------------
# Tested on:
#   bash 5.1.0
#
# ------------------------------------------

USERS="$(< /etc/passwd cut -d : -f 1)"
SHORT_HELP="
    $(basename "$0") - [OPTIONS]

    -h - Shows this help
    -v - Shows the current version
    -s - Sort alphabetically
    -c - Capitalize
"
VERSION="v1.2"

FLAG_SORT=0
FLAG_CAPIT=0

case "$1" in
    -h) echo "$SHORT_HELP" && exit 0;;
    -v) echo "$VERSION" && exit 0;;
    -s) FLAG_SORT=1;;
    -c) FLAG_CAPIT=1;;
    *) echo "$USERS";;
esac

[ $FLAG_SORT -eq 1 ] && echo "$USERS" | sort && exit 0
[ $FLAG_CAPIT -eq 1 ] && echo "$USERS" | tr '[:lower:]' '[:upper:]' && exit 0