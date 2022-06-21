const fs = require('fs');

let date = "", id = "", start = "", end = "";
let temp;

let stdinBuffer = fs.readFileSync(process.stdin.fd);

let objJson = JSON.parse(stdinBuffer);

//console.log(stdinBuffer.toString());
//console.log(objJson);

//get date 
date = objJson.loginDetails[0].shiftDate;
temp = date.split("T");
date = temp[0];

//get employee ID
id = objJson.loginDetails[0].userId;

//get shift start time 
start = objJson.loginDetails[0].startDate;
temp = start.split("T");
start = temp[1];
temp = start.split(".");
start = temp[0];
start = start.substr(0, 5);

//get shift end time 
let length = objJson.loginDetails.length;
end = objJson.loginDetails[length - 1].stopDate;
end = (end === null) ? objJson.loginDetails[length - 1].startDate : end;
temp = end.split("T");
end = temp[1];
temp = end.split(".");
end = temp[0];
end = end.substr(0, 5);

let query = 
`INSERT INTO login_info 
VALUES( 
 \"${date}\", 
 \"${id}\", 
 \"${start}\", 
 \"${end}\"
  );` 
console.log(query)
