#!/bin/bash

function read_dom {
	local IFS=\>
	read -d \< ENTITY CONTENT
}

#while read_dom; do
#	if [[ $ENTITY = "title" ]]; then
#		echo $CONTENT
#		exit
#	fi
#done < result.html > result.txt

while read_dom; do
	echo "$ENTITY => $CONTENT"
done < result.html

#url=https://practicalguidetoevil.wordpress.com/table-of-contents/

#response=$(curl ${url})

#curl $url > result.html

#echo "$response" | grep Book


