#!/bin/bash

/bin/bash spindle-octopus/run.sh &

while [ ! -f "lock" ] ;
do
  echo $(pwd) 
done


#DATE="05-27-2022"
DATE=$(date +'%m-%d-%Y')
START="$DATE"
END="$DATE"
DAVE="https://secure.spindlelive.com/api/dlmEmployee/GetEmployeeTracking?corpId=12&custNo=41100&empId=2100427&endDate=$START&startDate=$END"
LOUIS="https://secure.spindlelive.com/api/dlmEmployee/GetEmployeeTracking?corpId=12&custNo=41100&empId=2100319&endDate=$START&startDate=$END"
PETER="https://secure.spindlelive.com/api/dlmEmployee/GetEmployeeTracking?corpId=12&custNo=41100&empId=2100432&endDate=$START&startDate=$END"
TONY="https://secure.spindlelive.com/api/dlmEmployee/GetEmployeeTracking?corpId=12&custNo=41100&empId=2100361&endDate=$START&startDate=$END"
KENNY="https://secure.spindlelive.com/api/dlmEmployee/GetEmployeeTracking?corpId=12&custNo=41100&empId=2100428&endDate=$START&startDate=$END"
BOB="https://secure.spindlelive.com/api/dlmEmployee/GetEmployeeTracking?corpId=12&custNo=41100&empId=2100429&endDate=$START&startDate=$END"
KEVIN="https://secure.spindlelive.com/api/dlmEmployee/GetEmployeeTracking?corpId=12&custNo=41100&empId=2100427&endDate=05-12-2022&startDate=05-12-2022"

/bin/bash ./generate_request.sh

sleep 5
curl -v -H @curl_request $LOUIS > louis.json
curl -v -H @curl_request $PETER > peter.json
curl -v -H @curl_request $KENNY > kenny.json
curl -v -H @curl_request $KEVIN > kevin.json
curl -v -H @curl_request $TONY > tony.json
curl -v -H @curl_request $DAVE > dave.json

sleep 1
/usr/bin/node extract_updated_info.js < louis.json > louis.query
/usr/bin/node extract_updated_info.js < peter.json > peter.query
/usr/bin/node extract_updated_info.js < kenny.json > kenny.query
/usr/bin/node extract_updated_info.js < kevin.json > kevin.query
/usr/bin/node extract_updated_info.js < tony.json > tony.query
/usr/bin/node extract_updated_info.js < dave.json > dave.query

sleep 1
/bin/bash ./write_to_database.sh < louis.query
/bin/bash ./write_to_database.sh < peter.query
/bin/bash ./write_to_database.sh < kenny.query
/bin/bash ./write_to_database.sh < kevin.query
/bin/bash ./write_to_database.sh < tony.query
/bin/bash ./write_to_database.sh < dave.query

