const mysql = require('mysql');

let con = mysql.createConnection({
  host : "test-deployment.live",
  user: "u206225039_peter",
  password: "Re343bnm",
  database: "u206225039_database",
  port: "3306"
});

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT * FROM login_info", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});
