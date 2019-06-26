#!/bin/bash

function read_dom {
	local IFS=\>
	read -d \< ENTITY CONTENT
}

url=https://practicalguidetoevil.wordpress.com/table-of-contents/

curl $url | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -Eo '(http|https)://[^"]+' | grep chapter > result.html


