#!/bin/bash

function read_dom {
	local IFS=\>
	read -d \< ENTITY CONTENT
}

#url=https://practicalguidetoevil.wordpress.com/2015/04/08/chapter-2-invitation/
url=$1
echo "THE URL VAR IS $1"

curl $url | recode -i html..utf8 > resultFromChapter.html

while read_dom; do
	if [[ $ENTITY = 'span style="font-size:medium;"' ]]; then		
		echo ${CONTENT//â/\"}
	fi
done < resultFromChapter.html > ${2}.txt


