#!/bin/bash

function getColor {
	if [ "$1" = "V" ]
	then
		echo "black"
	elif [ "$1" = "D" ]
	then
		echo "blue"
	elif [ "$1" = "I" ]
	then
		echo "green"
	elif [ "$1" = "W" ]
	then
		echo "orange"
	elif [ "$1" = "E" ]
	then
		echo "red"
	elif [ "$1" = "A" ]
	then
		echo "yellow"
	else
		echo "black"
	fi
}

function openTag {
	firstChar=${1:0:1}
	
	a="<font color=\""
	b=$(getColor $firstChar)
	c="\">"

	echo $a$b$c
}

function closeTag {
	echo "</font><br>"
}

echo "Log Parser by Joe Mitchell"

OUTPUT_FILE=./output.html

echo "<html><body><h1>App Log</h1>" > "$OUTPUT_FILE"

# while loop
while read p; do

	openTag $p >> "$OUTPUT_FILE"
	echo $p >> "$OUTPUT_FILE"
	closeTag >> "$OUTPUT_FILE"

	echo -ne "."

done <AppLogs.txt

echo "</body></html>" >> "$OUTPUT_FILE"

echo -e "\nFinished!"
