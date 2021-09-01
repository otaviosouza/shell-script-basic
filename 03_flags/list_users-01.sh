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
#       - Initial script with if
#       - Add -s, -h & -v
#
# ------------------------------------------
# Tested on:
#   bash 5.1.0
#
# ------------------------------------------

USERS="$(< /etc/passwd cut -d : -f 1)"
SHORT_HELP="
    $0 - [OPTIONS]

    -h - Shows this help
    -v - Shows the current version
    -s - Sort alphabetically
"
VERSION="v1.0"

if [ "$1" = "-h" ]; then
    echo "$SHORT_HELP" && exit 0
fi
if [ "$1" = "-v" ]; then
    echo "$VERSION" && exit 0
fi
if [ "$1" = "-s" ]; then
    echo "$USERS" | sort && exit 0
fi

echo "$USERS"