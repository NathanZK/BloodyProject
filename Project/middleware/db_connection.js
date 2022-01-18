const mysql = require('mysql2');

//Create mysql connection
const connection = mysql.createConnection({
    host: "localhost" , 
    user: "root" ,
    password: "8MIN@20sec" ,
    database: "blooddonation"
});

connection.connect(
    function(err){
        if (err) console.log(err.message);
        else console.log("Connected!");
    }
);

module.exports  = connection;
