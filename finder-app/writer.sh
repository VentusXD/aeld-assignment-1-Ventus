#!/bin/sh

writefile="$1"
writestr="$2"

if [  $# -lt 2 ]; then
    echo "Usage: $0 <writefile> <witrestr>"
    exit 1
fi

#touch $writefile && echo $writestr > $writefile
writedir=$(dirname "$writefile")
mkdir -p "$writedir" || {
    echo "Error: cannot create directory '$writedir'"
    exit 1
}

printf '%s\n' "$writestr" > "$writefile" || {
    echo "Error: cannot write to '$writefile'"
    exit 1
}