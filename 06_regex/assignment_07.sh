#!/usr/bin/env bash
#
# assignment_07.sh - Assignment #07 solution
#
# Author:       Otávio Souza
#
# ------------------------------------------
# List the groups on GNU/Linux and aplly
# regular expressions as filters.
#
# This script uses ShellCheck - https://github.com/koalaman/shellcheck
# ------------------------------------------
# Change log:
#   v1.0 04/09/2021, Otávio Souza:
#       - Initial script
#       - Setting flags
#   v1.1 04/09/2021, Otávio Souza:
#       - Testing flags
#       - Release
# ------------------------------------------
# Tested on:
#   bash 5.1.0
#
# ------------------------------------------

GRPS="$(cut -d : -f 1 /etc/group)"

SHORT_HELP="
    $(basename "$0") - [OPTIONS]

    List all groups on system and apply filters
    according following inputs.

    -h - Shows this help
    -v - Shows the current version
     1 - Groups starting on 'r'
     2 - Groups finishing on 't'
     3 - Groups finishing on 'd' or 'e'
     4 - Groups not finishing on 'd' or 'e'
     5 - Groups starting on any digit, and second letter
         is 'd' or 'u'
     6 - Groups within 2 to 4 digits in size on name
     7 - Groups starting on 'r' or 's'
"
VERSION="v1.1"

FILTER="[1-7]"

RED="\033[31m" # red purple
NC="\033[0m"
ERROR="${RED}Something went wrong.${NC} Please check -h for help."

while test -n "$1"
do
    case "$1" in
        -h) echo "$SHORT_HELP" && exit 0    ;;
        -v) echo "$VERSION" && exit 0       ;;
        *)  if ! [[ $1 =~ $FILTER ]]; then
                echo -e "$ERROR" && exit 1
            else
                FILTER="$1"
            fi
    esac
    shift
done

case "$FILTER" in
    1) GRPS=$(echo "$GRPS" | grep "^r") && echo "$GRPS" && exit 0;;
    2) GRPS=$(echo "$GRPS" | grep "t$") && echo "$GRPS" && exit 0;;
    3) GRPS=$(echo "$GRPS" | grep -E "d$|e$") && echo "$GRPS" && exit 0;;
    4) GRPS=$(echo "$GRPS" | grep -E "[^ d|e]$") && echo "$GRPS" && exit 0;;
    5) GRPS=$(echo "$GRPS" | grep -E "^.d+|^.u+") && echo "$GRPS" && exit 0;;
    6) GRPS=$(echo "$GRPS" | grep -E "^.{2,4}$") && echo "$GRPS" && exit 0;;
    7) GRPS=$(echo "$GRPS" | grep -E "^r|^s") && echo "$GRPS" && exit 0;;
    *)  echo "$GRPS" && exit 0;;
esac