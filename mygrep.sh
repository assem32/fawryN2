#!/bin/bash

# Initialize flags
show_line_number=false
invert_match=false

# Process options first (flags -n and -v)
while getopts "nv" opt; do
  case $opt in
    n) show_line_number=true ;;   # Show line numbers
    v) invert_match=true ;;       # Invert match
    \?) echo "Usage: $0 [-n] [-v] search_string file"; exit 1 ;;  # Invalid options
  esac
done

# Shift off the processed options
shift $((OPTIND - 1))

# Get the search string and file name after options are processed
search_string="$1"
file="$2"

# Check if search string or file is missing
if [ -z "$search_string" ] || [ -z "$file" ]; then
  echo "Error: Missing search string or file"
  exit 1
fi

# Construct the grep options
grep_opts=""

# If -n (line numbers) is set, add -n to the grep options
[ "$show_line_number" = true ] && grep_opts="$grep_opts -n"

# If -v (invert match) is set, add -v to the grep options
[ "$invert_match" = true ] && grep_opts="$grep_opts -v"

# Always use -i for case-insensitive search
grep_opts="$grep_opts -i"

# Run the grep command with the constructed options
grep $grep_opts "$search_string" "$file"

