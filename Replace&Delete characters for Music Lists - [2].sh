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
tr -d ',/+-\"MP3©()(-) (SGAE) (SOCAN) (SAZAS) (STIM) (IMRO) (ARRANGER) (DP) () (Ç ÁÃÊÁËÉ¢ ÓÔÁ ÃÁËËÉÊ¢) ft Í FEAT FT ®' < "$input_file" > "$temp1"

# Replace characters mapped to 1 with a space
tr '•.,/+"MP3“”’©€…() (Ç ÁÃÊÁËÉ¢ ÓÔÁ ÃÁËËÉÊ¢) ft Í FEAT FT ®' '                              ' < "$temp1" > "$temp2"

# Replace special characters with their mapped values
tr 'ÑÉÄΆΈÈΌ©ÃÏÙΎÂÍÇΉΪÓ' 'N E A A E E O C A I U Y A I C H I O' < "$temp2" > "$final_output"

# Clean up temporary files
rm "$temp1" "$temp2"

echo "Processing complete. Output saved to $final_output"
