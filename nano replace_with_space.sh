#!/bin/bash

# Ensure a file argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

input_file=$1
temp1="temp1.csv"

# Replace characters mapped to 1 with a space
tr '~?!~#~$~%~^~&~*~@_[]{}•/()+ "“”' '                              ' < "$input_file" > "$temp1"

echo "Processing complete. Output saved to $temp1"
