#!/bin/bash
# Author:       sickcodes
# Contact:      https://twitter.com/sickcodes, https://github.com/sickcodes
# Copyright:    sickcodes (C) 2022
# License:      AGPLv3-or-later

# git clone https://github.com/sickcodes/bulk-whois.git
# cd bulk-whois

INPUT_FILE=${1}

[ -z "$INPUT_FILE" ] && echo 'Usage: ./bulk-whois.sh domains.txt' && exit 1

mkdir -p ./output

while read -r WHO; do
    WHO="$(basename "${WHO}")"
    whois "${WHO}" >>  "output/${WHO}.txt"
    echo "$? ${WHO}"
done < "${INPUT_FILE}"