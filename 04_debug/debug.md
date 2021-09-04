# Debug

*Debugging* is the process of finding and reducing defects in a software application or even hardware. Software errors include those that prevent the program from running and those that produce an unexpected result.

## Debug using bash

**$ bash -x ./scriptName.sh**

*Shows already substituted variables, commands and their arguments at the time of execution.*

Useful for small code with few variables.

**Example**

```cmd
$ bash -x ./list_users.sh -s
```
*Output:*
```cmd
++ cut -d : -f 1
+ USERS=''

++ basename ./list_users.sh
+ SHORT_HELP='
    list_users.sh - [OPTIONS]

    -h - Shows this help
    -v - Shows the current version
    -s - Sort alphabetically
    -c - Capitalize
'
+ VERSION=v1.3
+ FLAG_SORT=0
+ FLAG_CAPIT=0

+ test -n -s
+ case "$1" in
+ FLAG_SORT=1
+ shift
+ test -n ''
+ '[' 1 -eq 1 ']'
++ echo ''
++ sort

+ USERS=''
+ '[' 0 -eq 1 ']'
+ echo ''
```

## Debug using set

**set -x**

*Bash built-in to display debugging information only for troublesome zones.*

Use to debug part(s) of the script.

```shell
set -x			# activate debugging from here
#
# your code here
#
set +x			# stop debugging from here
```

## Debug function

```shell
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

KEY_DEBUG=0
DEBUG_LVL=0

Debug(){
    [ $1 -le $DEBUG_LVL ] && echo "Debug $* -----"
}

Sum(){
    local sum=0

    for i in $(seq 1 25); do
        Debug 1 "Starting for with value: $i"
        sum=$(($sum+$i))
        Debug 2 "After sum: $sum"
    done
    echo $sum
}

case "$1" in
    -d) [ $2 ] && DEBUG_LVL=$2;;
    *) Sum;;
esac

Sum
```