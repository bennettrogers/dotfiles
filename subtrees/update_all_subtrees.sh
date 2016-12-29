#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    ./subtree_update.sh -r $line
done < "$1"
