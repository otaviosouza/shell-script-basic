#!/usr/bin/env bash
#
# conf.sh - Setting file
#
# Author:       Souza, Otávio
# Maintainer:   Souza, Otávio
# GitHub:       https://github.com/otaviosouza
#
# -----------------------------------------------------------
# This script gets the settings from settings.cf.
# Settings.cf sets COLORFUL and/or CAPITALIZE message output.
#
# -----------------------------------------------------------
# Change log:
#   v1.0 04/09/2021, Otávio Souza:
#       - Initial script
#   v1.1 04/09/2021, Otávio Souza:
#       - COLORFUL and CAPITALIZE debug
#
# -----------------------------------------------------------
# Tested on:
#   bash 5.1.0
# -----------------------------------------------------------
CONF_FILE="settings.cf"

COLORFUL=
CAPITAL=

MSG="Test message"

RED="\033[1;31m"
GREEN="\033[32m"
NC="\033[0m"


# is settings readable?
[ ! -r "$CONF_FILE" ] && echo -e "${RED}No read access to settings.cf.${NC}" && exit 1

# functions
SetParam(){
    local param
    local val
    param="$(echo "$1" | cut -d = -f 1)"
    val="$(echo "$1" | cut -d = -f 2)"
    case "$param" in
        COLORFUL)   COLORFUL=$val   ;;
        CAPITAL)    CAPITAL=$val    ;;
    esac
}

# execution
while read -r line
do
    [ "$(echo "$line" | cut -c1)" = "#" ] && continue
    [ ! "$line" ] && continue
    SetParam "$line"
done < "$CONF_FILE"

[ "$CAPITAL" -eq 1 ] && MSG="$(echo -e "$MSG" | tr '[:lower:]' '[:upper:]')"
[ "$COLORFUL" -eq 1 ] && MSG="$(echo -e "${GREEN}$MSG${NC}")"

echo "$MSG"