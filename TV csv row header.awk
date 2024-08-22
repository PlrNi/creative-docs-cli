# Skip the first two lines of the input file
NR <= 2 {
    next
}

# Print the header row
BEGIN {
    print "INDEX\tUSAGE\tDURATION\tPRODUCTION\tSEASON\tEPISODE\tCOMMENTS\tTITLE\tARTIST\tCOMPOSER\tLYRICIST"
}

# Print the remaining lines of the file
{
    print
}
