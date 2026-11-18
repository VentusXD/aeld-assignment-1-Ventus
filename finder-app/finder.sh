#!/bin/sh

filesdir="$1"
searchstr="$2"

if [ $# -lt 2 ]; then
    echo "Error need 2 arguments"
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory on the filesystem"
    exit 1
fi

X=$(find "$filesdir" -type f | wc -l) # count files

Y=$(grep -rF -e "$searchstr" "$filesdir" 2>/dev/null | wc -l) # count dir

echo "The number of files are ${X} and the number of matching lines are ${Y}"

exit 0