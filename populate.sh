#!/bin/bash
#the first echo shows the arguments
echo "First Echo: $@"
#the second echo shows the number or arguments
echo "Second Echo: $#"
#the third echo shows the script that was run
echo "Third Echo: $0"
#the fourth echo shows the first argument
echo "Fourth Echo: $1"

for tempVar in "$@";
do
echo "ARG: " $tempVar
done


