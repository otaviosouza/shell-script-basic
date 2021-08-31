#!/usr/bin/env bash

echo "-- For: pattern 1 --"
for ((i=0; i<10;i++)); do
    echo "$i"
done

echo "-- For: pattern 2 (seq) --"
for i in $(seq 10)
do
    echo "$i"
done

echo "-- For: pattern 3 (array) --"

FRUITS=(
    'Oranges'
    'Plums'
    'Pineapples'
)

for i in "${FRUITS[@]}";do
    echo "$i"
done

echo "-- While --"
N_COUNTER=0
while [[ $N_COUNTER -lt ${#FRUITS[@]} ]]; do
    echo $N_COUNTER
    N_COUNTER=$((N_COUNTER+1))
done