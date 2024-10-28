#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Provide a file to check"
fi

if [ -f "$1" ]; then
	cat "$1"
else
	echo "File does not exist!"
fi

while true; do
	read -p "Enter input (type 'exit' to quit): " input 
	if [ "$input" == "exit" ]; then
		exit 0
	else
		echo "$input"
	fi
done

