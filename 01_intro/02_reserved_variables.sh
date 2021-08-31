#!/usr/bin/env bash

echo "-- Reserved Variables --"

echo "Script name: $0"

# $ ./<script_name> a
echo "Parameter 1: $1" # output: a

# $ ./<script_name> a b
echo "Parameter 2: $2" # output: b
echo "All parameters: $*" # output: a b

echo "How many parameters: $#"

echo "Last command exit code: $?" # 0: no errors ; !0: some error occurred

echo "PID: $$"