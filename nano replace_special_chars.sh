#!/bin/bash

# Ensure a file argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

input_file=$1
final_output="final_output.csv"

# Replace special characters with their mapped values
tr 'ÑÉ’ÄΆΈÈΌ©ÃÏÙΎÂ€™…ΉΪÓʼ' 'N E ’ A A E E O C A I U Y A € ™ … H I O ’' < "$input_file" > "$final_output"

echo "Processing complete. Output saved to $final_output"
