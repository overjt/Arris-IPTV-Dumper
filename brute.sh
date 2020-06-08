#!/bin/bash
while IFS= read -r line || [[ -n "$line" ]]; do
    echo "Downloading: $line"
    ./lfi.sh $line
done < $1