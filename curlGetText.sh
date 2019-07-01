#!/bin/bash

function read_dom {
	local IFS=\>
	read -d \< ENTITY CONTENT
}

url=https://practicalguidetoevil.wordpress.com/2015/04/08/chapter-2-invitation/

curl $url > resultFromChapter2.html

while read_dom; do
	if [[ $ENTITY = 'span style="font-size:medium;"' ]]; then
		echo "$ENTITY => $CONTENT"  
	fi
done < resultFromChapter2.html > tsekare.txt

