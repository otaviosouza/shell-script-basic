#!/usr/bin/env bash
#
# colorful_debug.sh - Use of colors in script
#
# Author:       Otávio Souza
#
# -----------------------------------------------
# Control characters class on Matthew Muller's Course
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

DEBUG_LVL=0

PURPLE="\033[1;35m" # bold purple
CYAN="\033[1;36m" # bold cyan

Debug(){
    [ "$1" -le $DEBUG_LVL ] && echo -e "${2}Debug $*"
}

Sum(){
    local sum=0

    for i in $(seq 1 25); do
        Debug 1 "${PURPLE}" "Before sum: $i"
        sum=$((sum+i))
        Debug 2 "${CYAN}" "After sum: $sum"
    done
    echo $sum
}

case "$1" in
    -d) [ "$2" ] && DEBUG_LVL=$2 && Sum ;;
    *) Sum                              ;;
esac