#!/bin/bash

URL="$1"

rawurlencode() {
    local string="${1}"
    local strlen=${#string}
    local encoded=""
    local pos c o

    for (( pos=0 ; pos<strlen ; pos++ )); do
        c=${string:$pos:1}
        case "$c" in
           [-_.~a-zA-Z0-9] ) o="${c}" ;;
           * )               printf -v o '%%%02x' "'$c"
        esac
        encoded+="${o}"
    done
    echo "${encoded}"
}


curl "https://web.archive.org/save/$URL" --data-raw 'url='$( rawurlencode "$URL" )'&capture_all=on' -o out.html

echo
echo ============================================
echo "$URL has been submitted to Internet Archive"
echo "out.html file contains the result of the operation (for debugging)"
echo "Make sure the snapshot has been created within a few minutes:"
echo "https://web.archive.org/web/*/$URL"
echo ============================================
