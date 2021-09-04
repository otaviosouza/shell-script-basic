#!/usr/bin/env bash
#
# assignment_08.sh - Extract post titles
#
# Author:       Otávio Souza
#
# ------------------------------------------
# Extract post titles from a website and
# show them on screen.
#
# This script uses ShellCheck - https://github.com/koalaman/shellcheck
# ------------------------------------------
# Change log:
#   v1.0 04/09/2021, Otávio Souza:
#       - Regex text on command line
#       - First code
# ------------------------------------------
# Tested on:
#   bash 5.1.0
#
# ------------------------------------------

TITLES_FILES="source.txt"

RED="\033[1;31m"
GREEN="\033[32m"
NC="\033[0m"

[ ! -x "$(which curl)" ] && echo -e "${RED}Curl is not installed. Please install curl first.${NC}" && exit 1

curl https://fedoramagazine.org/ | grep post-title | sed 's/<h2.*">//;s/<\/a.*//' > source.txt

while read -r title_fedora
do
    echo -e "${RED}Title:${NC} ${GREEN}$title_fedora${NC}"
done < "$TITLES_FILES"