#!/bin/bash

function check {
    echo -e "Searching for files of name containing $1 in $2\n"

	#f=`find $2 -name "*$1*" -print | wc -l`
    c=0

    while IFS= read -r -d '' file; do
        ((++c))
        echo $file
    done < <(find $2 -type f -name "*$1*" -print0)
    
    echo -e "\nFound $c files"
}

if [[ $# -lt 1 ]]; then
    echo "Illegal number of parameters"
    exit 2
fi

file=$1

if [ -z $2 ]; then
    dir=`pwd`
else
    dir=$2
fi

check $file $dir
