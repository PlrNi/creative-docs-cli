#!/bin/bash

# Ensure a file argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

input_file=$1
temp1="temp1.csv"
temp2="temp2.csv"
final_output="final_output.csv"

# Remove characters mapped to 0
tr -d '.MP3.*.WAV.r⎵.NEW;0:1:2:3:4:5:6:7:8:9:•/()+ "MP3“”' < "$input_file" > "$temp1"

# Replace characters mapped to 1 with a space
tr '~?!~#~$~%~^~&~*~@_[]{}•/()+ "“”' '                              ' < "$temp1" > "$temp2"

# Replace special characters with their mapped values
tr 'ÑÉ’ÄΆΈÈΌ©ÃÏÙΎÂ€™…ΉΪÓʼ' 'N E ’ A A E E O C A I U Y A € ™ … H I O ’' < "$temp2" > "$final_output"

# Clean up temporary files
rm "$temp1" "$temp2"

echo "Processing complete. Output saved to $final_output"
