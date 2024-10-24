#!/bin/bash

temp_file=$(mktemp)

curl -L -o $temp_file https://github.com/skpomerv/data1201/archive/refs/heads/main.zip

unzip $temp_file -d ~/data1201/labs

mv ~/data1201/labs/data1201-main ~/data1201/labs/lab9

