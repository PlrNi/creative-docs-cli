#!/bin/bash

# Ensure a file argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

input_file=$1
temp1="temp1.csv"
final_output="final_output.csv"

# Create a sed script for processing
sed_script=$(mktemp)

# Write the sed commands to the temp script
cat <<EOF > "$sed_script"
# Delete characters mapped to 0
s/\(\.MP3\.\*\|\.WAV\|\.r⎵\|\.NEW\.\*\|;\|0:1:2:3:4:5:6:7:8:9\|:|\•|\|\/|\(|\)|\+\|"\|MP3\|“\|”\)//g

# Replace characters mapped to 1 with a space
s/~\?\|~!\|~#\|~\$\|~%\|~\^\|~&\|~\*\|~@\|_\|[\*\]|\{\*\}\|•\|\/\|\(|\)|\+\|"\|“\|”/ /g

# Replace special characters with their mapped values
s/Ñ/N/g
s/É/E/g
s/’/’/g
s/Ä/A/g
s/Ά/A/g
s/Έ/E/g
s/È/E/g
s/Ό/O/g
s/©/C/g
s/Ã/A/g
s/Ï/I/g
s/Ù/U/g
s/Ύ/Y/g
s/Â/A/g
s/€/€/g
s/™/™/g
s/…/…/g
s/Ή/H/g
s/Ϊ/I/g
s/Ó/O/g
s/ʼ/’/g
EOF

# Apply the sed script to the input file
sed -f "$sed_script" "$input_file" > "$final_output"

# Clean up temporary sed script
rm "$sed_script"

echo "Processing complete. Output saved to $final_output"
