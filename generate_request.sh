#!/bin/bash


TOKEN="$(cat bearer.txt)"

echo "Host: secure.spindlelive.com
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0
Accept: application/json, text/plain, */*
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Authorization: $TOKEN
Connection: keep-alive
Referer: https://secure.spindlelive.com/
Cookie: _ga=GA1.2.1402709580.1651788786; _gid=GA1.2.134943361.1652315518
Sec-Fetch-Dest: empty
Sec-Fetch-Mode: cors
Sec-Fetch-Site: same-origin
TE: trailers" > curl_request
