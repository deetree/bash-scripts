#!/bin/bash

function check {
	arr=("$1"/*)
	b=($(for l in ${arr[@]}; do echo $l; done | sort -r))
	
	for file in ${b[@]}; do
		if [[ -d $file ]]; then
			echo $file
			check $file
		fi
	done
}

check .
