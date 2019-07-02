#!/bin/bash
function read_dom {
	local IFS=\>
	read -d \< ENTITY CONTENT
}

url=https://practicalguidetoevil.wordpress.com/table-of-contents/
#url=$1

curl $url | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -Eo '(http|https)://[^"]+' | grep chapter > result.html

ARRAY=()
while IFS= read -r line
do 
	ARRAY+=("$line")	
done < result.html

counter=1
for i in "${ARRAY[@]}"
do
	sh ./curlGetText.sh $i $counter
	counter=$((counter+1))
done
