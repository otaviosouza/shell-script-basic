#!/usr/bin/env bash
#
# debugging.sh - Use of debug function
#
# Author:       Otávio Souza
#
# -----------------------------------------------
# Debug function class on Matthew Muller's Course
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

Debug(){
    [ "$1" -le $DEBUG_LVL ] && echo "Debug $*"
}

Sum(){
    local sum=0

    for i in $(seq 1 25); do
        Debug 1 "Before sum: $i"
        sum=$((sum+i))
        Debug 2 "After sum: $sum"
    done
    echo $sum
}

case "$1" in
    -d) [ "$2" ] && DEBUG_LVL=$2 && Sum ;;
    *) Sum                              ;;
esac