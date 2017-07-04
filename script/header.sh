#!/bin/bash

URL="$1"

if [[ $URL == "" ]];
then
	echo "missing url"
	exit 1
fi

curl "$URL" \
  -H 'Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no, akamai-x-get-request-id,akamai-x-get-nonces,akamai-x-get-client-ip,akamai-x-feo-trace' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36' \
  -H 'Referer: https://www.amazon.com/' \
  -H 'Cache-Control: no-cache' \
  --compressed -s -L -I

