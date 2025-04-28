1-Processing Flags with getopts:
The getopts loop is used to process the flags (-n and -v).
The flags determine how the grep command will be executed.
-n: Tells the script to show line numbers in the output.
-v: Inverts the search, meaning it will match lines that do not contain the search string.
getopts checks for these flags and sets corresponding variables (show_line_number and invert_match) to true or false based on whether the flags are passed.

2-Shifting the Positional Arguments:
After processing the options, the script uses the shift command to remove the options from the argument list, leaving only the positional arguments (the search string and the file).
This ensures that $1 (the search string) and $2 (the file name) are the only remaining arguments.

3-Checking for Missing Arguments:
The script checks if either the search string or the file is missing by verifying if $1 or $2 is empty. If either is missing, it exits with an error message.

4-Constructing grep Options:
The script builds the grep options dynamically based on the flags set earlier:
-n: Adds -n if show_line_number is true.
-v: Adds -v if invert_match is true.
-i: Adds -i to make the search case-insensitive (this is always included).
These options are combined in the grep_opts variable.
5-Running the grep Command:
Finally, the script runs the grep command with the constructed options and searches for the provided string in the specified file.
