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
#   v1.2 04/09/2021, Otávio Souza:
#       - Including missing condition:
#           Groups starting on 'r' and finishing on 't'.
#       - Script refactoring
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
     8 - Groups starting on 'r' and finishing on 't'
"
VERSION="v1.2"

FILTER="[1-8]"

RED="\033[31m" # red
NC="\033[0m"
ERROR="${RED}Something went wrong.${NC} Please check -h for help."

OUTPUT=""

while test -n "$1"
do
    case "$1" in
        -h) OUTPUT="${SHORT_HELP}";;
        -v) OUTPUT="${VERSION}";;
        *)  if ! [[ $1 =~ $FILTER ]]; then
                echo -e "${ERROR}" && exit 1
            else
                FILTER="$1"
                case "$FILTER" in
                    1) OUTPUT=$(echo "$GRPS" | grep "^r") ;;
                    2) OUTPUT=$(echo "$GRPS" | grep "t$") ;;
                    3) OUTPUT=$(echo "$GRPS" | grep -E "[de]$");;
                    4) OUTPUT=$(echo "$GRPS" | grep -E "[^de]$");;
                    5) OUTPUT=$(echo "$GRPS" | grep -E "^.[du]");;
                    6) OUTPUT=$(echo "$GRPS" | grep -E "^.{2,4}$");;
                    7) OUTPUT=$(echo "$GRPS" | grep -E "^r|^s");;
                    8) OUTPUT=$(echo "$GRPS" | grep -E "^r.*t$");;
                    *) OUTPUT="$GRPS";;
                esac
            fi
    esac
    shift
done

echo "$OUTPUT" && exit 0