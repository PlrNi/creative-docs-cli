#!/usr/bin/awk -f

# Define the characters to remove (mapped to 0)
BEGIN {
    to_remove = ".MP3.*.WAV.r⎵.NEW;0:1:2:3:4:5:6:7:8:9:•/()+ \"MP3“”"
    gsub(/[.MP3.*.WAV.r⎵.NEW;0:1:2:3:4:5:6:7:8:9:•/()+ "MP3“”]/, "")
    
    # Define the replacements for characters mapped to 1 (replace with a space)
    replacements["~?"] = " "
    replacements["~!"] = " "
    replacements["~#"] = " "
    replacements["~$"] = " "
    replacements["~%"] = " "
    replacements["~^"] = " "
    replacements["~&"] = " "
    replacements["~*"] = " "
    replacements["~@"] = " "
    replacements["_"] = " "
    replacements["[*]"] = " "
    replacements["{*}"] = " "
    replacements["•"] = " "
    replacements["/"] = " "
    replacements["("] = " "
    replacements[")"] = " "
    replacements["+"] = " "
    replacements["\""] = " "
    replacements["“"] = " "
    replacements["”"] = " "
    
    # Define the special character replacements
    special_replacements["Ñ"] = "N"
    special_replacements["É"] = "E"
    special_replacements["’"] = "’"
    special_replacements["Ä"] = "A"
    special_replacements["Ά"] = "A"
    special_replacements["Έ"] = "E"
    special_replacements["È"] = "E"
    special_replacements["Ό"] = "O"
    special_replacements["©"] = "C"
    special_replacements["Ã"] = "A"
    special_replacements["Ï"] = "I"
    special_replacements["Ù"] = "U"
    special_replacements["Ύ"] = "Y"
    special_replacements["Â"] = "A"
    special_replacements["€"] = "€"
    special_replacements["™"] = "™"
    special_replacements["…"] = "…"
    special_replacements["Ή"] = "H"
    special_replacements["Ϊ"] = "I"
    special_replacements["Ó"] = "O"
    special_replacements["ʼ"] = "’"
}

{
    # Remove unwanted characters
    gsub(/[.MP3.*.WAV.r⎵.NEW;0:1:2:3:4:5:6:7:8:9:•/()+ "MP3“”]/, "")

    # Replace characters mapped to 1 with a space
    for (key in replacements) {
        gsub(key, replacements[key])
    }
    
    # Replace special characters with their mapped values
    for (key in special_replacements) {
        gsub(key, special_replacements[key])
    }
    
    print
}
