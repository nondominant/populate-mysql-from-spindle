#!/bin/bash

VAR=""
while read line 
do
  VAR="$VAR $line"

done < "${1:-/dev/stdin}"

echo "-----------------------------"
echo $VAR
echo ""
echo "-----------------------------"

mysql -u u206225039_peter -h test-deployment.live -P 3306 -D u206225039_database -pRe343bnm $VAR > output

#select * from login_info;
#delete from login_info limit 100;
#select * from login_info;
