#!/usr/bin/env bash
#
# users.sh - System to manage users
#
# Author:       Souza, Otávio
# Maintainer:   Souza, Otávio
# GitHub:       https://github.com/otaviosouza
#
# -----------------------------------------------------------
# This script do all user management functions as create,
# delete and update.
#
# Example:
#   $ source users.sh
#   $ UserList
#
# This script uses ShellCheck - https://github.com/koalaman/shellcheck
# -----------------------------------------------------------
# Changelog:
#   v1.0 05/09/2021, Otávio Souza:
#       - Error handling
#       - List users on database
#       - Implement CRUD for user
#   v2.0 05/09/2021, Otávio Souza:
#       - GUI with dialog
#
# -----------------------------------------------------------
# Tested on:
#   bash 5.1.0
# -----------------------------------------------------------
# Thanks:
#   Mateus Müller (https://bit.ly/3BYPyiT) - For dedicating
#   your personal time to this course.
#
# -----------------------------------------------------------

VERSION="2.0"

DB_FILE="users_db.txt"
TEMP=temp.$$

SEP=":"

RED="\033[1;31m"
NC="\033[0m"

[ ! -e "$DB_FILE" ] && echo -e "${RED}ERROR. The database does not exist.${NC}" && exit 1
[ ! -r "$DB_FILE" ] && echo -e "${RED}ERROR. Read permission denied.${NC}" && exit 1
[ ! -w "$DB_FILE" ] && echo -e "${RED}ERROR. Write permission denied.${NC}" && exit 1
[ ! -x "$(which dialog)" ] && echo -e "${RED}ERROR. Dialog is not installed.${NC}" && exit 1

ValidateUser(){
    grep -i -q "$1$SEP" "$DB_FILE" # -i : ignore case -q : quiet
}

ListUsers(){
    grep -Ev "^#|^$" "$DB_FILE" | tr $SEP ' ' > "$TEMP"
    dialog --title "Users List" --textbox "$TEMP" 20 40
    rm -f "$TEMP"
}

SortUsers(){
    sort "$DB_FILE" > "$TEMP"
    mv "$TEMP" "$DB_FILE"
}

while :
do
    action=$(dialog --title "User management $VERSION" \
                   --stdout \
                   --menu "Choose your action" \
                   0 0 0 \
                   List "List users" \
                   Remove "Remove user" \
                   Create "Create user")
    
    [ ! "$action" ] && exit

    case $action in
        List) ListUsers     ;;
        Remove)
            users=$(grep -Ev "^#|^$" "$DB_FILE" | sort -h | cut -d $SEP -f 1,2 | sed 's/:/ "/;s/$/"/')
        
            # shellcheck disable=SC2086  # Variable cannot be quoted to be expanded
            id_del=$(eval dialog --stdout --menu \"Choose the user to be removed\" 0 0 0 $users)
            [ ! "$id_del" ] && continue

            grep -iv "^$id_del$SEP" "$DB_FILE" > "$TEMP"
            mv "$TEMP" "$DB_FILE"
            dialog --title "SUCCESS!" --msgbox "User removed with success." 10 40
            ListUsers
        ;;
        Create)
            last_id=$(grep -Ev "^#|^$" $DB_FILE | sort -h | tail -n 1 | cut -d $SEP -f 1)
            new_id=$((last_id+1))
            name=$(dialog --title "Create user" --stdout --inputbox "User name" 0 0)
            [ ! "$name" ] && continue
            ValidateUser "$name" && {
                dialog --title "ERROR" --msgbox "User $name already exists." 6 40
                continue
            }
            email=$(dialog --title "Create user" --stdout --inputbox "User e-mail" 0 0)
            [ ! "$email" ] && continue

            echo "$new_id$SEP$name$SEP$email" >> "$DB_FILE"
            dialog --title "SUCCESS!" --msgbox "User $name created with success." 10 40
            ListUsers
        ;;
    esac
done