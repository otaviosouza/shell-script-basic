#!/usr/bin/env bash
#
# conf.sh - Setting file
#
# Author:       Souza, Otávio
# Maintainer:   Souza, Otávio
# GitHub:       https://github.com/otaviosouza
#
# -----------------------------------------------------------
# More detailed description about the script,
# including way to use.
#
# -----------------------------------------------------------
# Change log:
#   v1.0 dd/mm/yyyy, Author:
#       - What has changed?
#       - Why changed?
#
# -----------------------------------------------------------
# Tested on:
#   bash 5.1.0
# -----------------------------------------------------------
CONF_FILE="settings.cf"

COLORFUL=
CAPITALIZE=

MSG="Test message"

RED="\033[1;31m"
GREEN="\033[32m"
NC="\033[0m"


# check read access to settings

[ ! -r "$CONF_FILE" ] && echo -e "${RED}No read access to settings.cf.${NC}" && exit 1

while read -r line
do
    [ "$(echo "$line" | cut -c1)" = "#" ] && continue
    [ ! "$line" ] && continue
    echo "$line"
done < "$CONF_FILE"