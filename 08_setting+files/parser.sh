#!/usr/bin/env bash

CONF_FILE="$1"

RED="\033[1;31m"

# settings exist?
[ ! -e "$CONF_FILE" ] && echo -e "${RED}The file does not exist.${NC}" && exit 1

# is settings readable?
[ ! -r "$CONF_FILE" ] && echo -e "${RED}Read permission denied.${NC}" && exit 1

while read -r line
do
    [ "$(echo "$line" | cut -c1)" = "#" ] && continue
    [ ! "$line" ] && continue

    key="$(echo "$line" | cut -d = -f 1)"
    val="$(echo "$line" | cut -d = -f 2)"

    echo "CONF_$key=$val"
    
done < "$CONF_FILE"

