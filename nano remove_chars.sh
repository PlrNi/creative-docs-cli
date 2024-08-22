#!/bin/bash

# Ensure a file argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

input_file=$1
temp1="temp1.csv"

# Remove characters mapped to 0
tr -d '.MP3.*.WAV.r⎵.NEW;0:1:2:3:4:5:6:7:8:9:•/()+ "MP3“”' < "$input_file" > "$temp1"

echo "Processing complete. Output saved to $temp1"
