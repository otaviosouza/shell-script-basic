#!/usr/bin/env bash
#
# title_extract.sh - Extract post titles
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

TITLES_FILES="titles.txt"

RED="\033[1;31m"
GREEN="\033[32m"
NC="\033[0m"

[ ! -x "$(which lynx)" ] && echo -e "${RED}Lynx is not installed. Please install lynx first.${NC}" && exit 1

lynx -source http://lxer.com/ | grep blurb | sed 's/<div.*line">//;s/<\/span.*//' > titles.txt

while read -r title_lxer
do
    echo -e "${RED}Title:${NC} ${GREEN}$title_lxer${NC}"
done < "$TITLES_FILES"