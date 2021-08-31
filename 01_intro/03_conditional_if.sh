#!/usr/bin/env bash

VAR_1=""
VAR_2=""

# First pattern
if [[ "$VAR_1" = "$VAR_2" ]]; then
    echo "They are equal"
fi

# Second pattern
if [[ "$VAR_1" = "$VAR_2" ]]
then
    echo "They are equal"
fi

# Third pattern
if [ "$VAR_1" = "$VAR_2" ]
then
    echo "They are equal"
fi

# Fourth pattern
if test "$VAR_1" = "$VAR_2"
then
    echo "They are equal"
fi

# Binary operator
[ "$VAR_1" = "$VAR_2" ] || echo "They are equal"