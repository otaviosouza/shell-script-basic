#!/usr/bin/env bash

# assigning variable
NUMSTRING="1"

NUM=1

NUM_1=23
NUM_2=39

# receives the sum of NUM_1 and NUM_2
TOTAL=$((NUM_1+NUM_2))

# assigning command
# CAT_OUT="$(cat /etc/passwd | grep jovem)" - useless
CAT_OUT="$(< /etc/passwd grep jovem)"

# printing variables
echo $NUMSTRING
echo $NUM
echo "$TOTAL"

echo "$CAT_OUT"
