#!/usr/bin/env bash
#
# ext_regex.sh - Extended regular expressions
#
# Author:       Otávio Souza
#
# -----------------------------------------------
# Regular expressions class on Matthew Muller's Course
#
# This script uses ShellCheck - https://github.com/koalaman/shellcheck
# -----------------------------------------------
# Change log:
#   v1.0 04/09/2021, Otávio Souza:
#       - Initial script
#
# ------------------------------------------
# Tested on:
#   bash 5.1.0
#
# ------------------------------------------

GREEN="\033[1;32m"
NO_COLOR="\033[0m"

# filter content with at least 50 digits
echo -e "${GREEN}grep -E \".{50,}$\" /etc/passwd:${NO_COLOR}" && grep -E ".{50,}$" /etc/passwd

# filter content with 50 up to 60 digits
echo -e "${GREEN}grep -E \".{50,60}$\" /etc/passwd:${NO_COLOR}" && grep -E ".{50,60}$" /etc/passwd