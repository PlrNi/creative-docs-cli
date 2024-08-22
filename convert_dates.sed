# Transform DDMMYYYY HHMMSS to YYYYMMDDHHMMSS

# Match the date format DDMMYYYY HHMMSS
s#([0-9]{2})([0-9]{2})([0-9]{4}) ([0-9]{2})([0-9]{2})([0-9]{2})#321456#g
