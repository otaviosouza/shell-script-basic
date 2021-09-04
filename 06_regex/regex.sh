#!/usr/bin/env bash
#
# regex.sh - Some regular expressions
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

PURPLE="\033[1;35m" # bold purple
NO_COLOR="\033[0m"

# Common regular expressions
printf "%b grep \"^m\" /etc/passwd:%b\n" "${PURPLE}" "${NO_COLOR}" && grep "^m" /etc/passwd

printf "%b grep \"h$\" /etc/passwd:%b\n" "${PURPLE}" "${NO_COLOR}" && grep "h$" /etc/passwd

printf "%b grep \"^r.*h$\" /etc/passwd:%b\n" "${PURPLE}" "${NO_COLOR}" && grep "^r.*h$" /etc/passwd