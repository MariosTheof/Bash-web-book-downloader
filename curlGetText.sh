#!/bin/bash

function read_dom {
	local IFS=\>
	read -d \< ENTITY CONTENT
}

url=$1

curl $url | recode -i html..utf8 > resultFromChapter.html

while read_dom; do
	if [[ $ENTITY = 'span style="font-size:medium;"' ]]; then		
		echo ${CONTENT//â/\"}
	fi
done < resultFromChapter.html > ${2}.txt

echo "Downloaded chapter ${2}"
