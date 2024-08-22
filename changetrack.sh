#!/bin/bash 
# changetrack--Tracks a given URL and logs changes

# Check if the LOG_DIR environment variable is set; otherwise, prompt for input
if [ -z "$LOG_DIR" ]; then
  read -p "Enter the directory to save log files (e.g., /path/to/directory): " LOG_DIR
  if [ ! -d "$LOG_DIR" ]; then
    echo "Directory does not exist. Creating it now."
    mkdir -p "$LOG_DIR"
  fi
fi

# Determine the directory of the script
script_dir="$(dirname "$(realpath "$0")")"

# Define paths relative to the provided LOG_DIR
sitearchive="$LOG_DIR/changetrack"
logfile="$LOG_DIR/changetrack.log"
tmpchanges="$sitearchive/changes.$$" # Temp file
dirperm=755 # read+write+execute for dir owner
fileperm=644 # read+write for owner, read only for others

trap "$(which rm) -f $tmpchanges" 0 1 15 # Remove temp file on exit

if [ $# -ne 1 ] ; then
  echo "Usage: $(basename $0) url" >&2
  exit 1
fi

# Check for both http:// and https://
if [[ "$(echo $1 | cut -c1-7)" != "http://" && "$(echo $1 | cut -c1-8)" != "https://" ]] ; then
  echo "Please use fully qualified URLs (e.g., start with 'http://' or 'https://')" >&2
  exit 1
fi

fname="$(echo $1 | sed 's/http[s]*:\/\///g' | tr '/?&' '...')"

# Create directory if it doesn't exist
if [ ! -d "$sitearchive" ] ; then
  if ! mkdir -p "$sitearchive" ; then
    echo "$(basename $0) failed: couldn't create $sitearchive." >&2
    exit 1
  fi
  chmod $dirperm "$sitearchive"
fi

# Grab a copy of the web page and put it in a temporary file.
lynx -dump "$1" | uniq > "$sitearchive/${fname}.new"

# Check if the .new file was created successfully
if [ ! -f "$sitearchive/${fname}.new" ] ; then
  echo "Error: Failed to create $sitearchive/${fname}.new. The website might be inaccessible, or there was a problem fetching the page." >&2
  exit 1
fi

if [ -f "$sitearchive/$fname" ] ; then
  # Compare the new content with the previous version.
  diff "$sitearchive/$fname" "$sitearchive/${fname}.new" > "$tmpchanges"

  if [ -s "$tmpchanges" ] ; then
    echo "Status: Site $1 has changed since our last check."
    echo "$(date): Site $1 has changed." >> "$logfile"
    cat "$tmpchanges" >> "$logfile"
    echo "" >> "$logfile"
  else
    echo "Status: No changes for site $1 since last check."
    rm -f "$sitearchive/${fname}.new" # Nothing new...
    exit 0
  fi
else
  echo "Status: First visit to $1. Initial content saved for future checks."
  echo "$(date): First visit to $1. Initial content saved." >> "$logfile"
fi

# Update the saved snapshot of the website.
mv "$sitearchive/${fname}.new" "$sitearchive/$fname"
chmod $fileperm "$sitearchive/$fname"

exit 0
