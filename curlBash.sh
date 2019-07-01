#!/bin/bash
function read_dom {
	local IFS=\>
	read -d \< ENTITY CONTENT
}

url=https://practicalguidetoevil.wordpress.com/table-of-contents/

curl $url | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -Eo '(http|https)://[^"]+' | grep chapter > result.html

ARRAY=()
while IFS= read -r line
do 
	echo "HOP"
	ARRAY+=("$line")	
done < result.html

printf '%s\n' "${ARRAY[@]}"

