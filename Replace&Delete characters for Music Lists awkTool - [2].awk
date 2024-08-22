#!/usr/bin/awk -f

# Define the characters to remove (mapped to 0)
BEGIN {
    # Define characters to remove (mapped to 0)
    to_remove = ",/+-\"MP3©()(-) (SGAE) (SOCAN) (SAZAS) (STIM) (IMRO) (ARRANGER) (DP) () (Ç ÁÃÊÁËÉ¢ ÓÔÁ ÃÁËËÉÊ¢) ft Í FEAT FT ®"
    gsub(/[,\-/+"MP3©()(-) (SGAE) (SOCAN) (SAZAS) (STIM) (IMRO) (ARRANGER) (DP) () (Ç ÁÃÊÁËÉ¢ ÓÔÁ ÃÁËËÉÊ¢) ft Í FEAT FT ®]/, "")

    # Define replacements for characters mapped to 1 (replace with a space)
    replacements["•"] = " "
    replacements["."] = " "
    replacements[","] = " "
    replacements["/"] = " "
    replacements["+"] = " "
    replacements["\""] = " "
    replacements["MP3"] = " "
    replacements["“"] = " "
    replacements["”"] = " "
    replacements["’"] = " "
    replacements["©"] = " "
    replacements["€"] = " "
    replacements["…"] = " "
    replacements["("] = " "
    replacements[")"] = " "
    replacements["(Ç ÁÃÊÁËÉ¢ ÓÔÁ ÃÁËËÉÊ¢)"] = " "
    replacements["ft"] = " "
    replacements["Í"] = " "
    replacements["FEAT"] = " "
    replacements["FT"] = " "
    replacements["®"] = " "
    
    # Define special character replacements
    special_replacements["Ñ"] = "N"
    special_replacements["É"] = "E"
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
    special_replacements["Í"] = "I"
    special_replacements["Ç"] = "C"
    special_replacements["Ή"] = "H"
    special_replacements["Ϊ"] = "I"
    special_replacements["Ó"] = "O"
}

{
    # Remove unwanted characters
    gsub(/[,\-/+"MP3©()(-) (SGAE) (SOCAN) (SAZAS) (STIM) (IMRO) (ARRANGER) (DP) () (Ç ÁÃÊÁËÉ¢ ÓÔÁ ÃÁËËÉÊ¢) ft Í FEAT FT ®]/, "")

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
