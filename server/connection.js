import mysql from 'mysql'
import { config } from 'process';
import { promisify } from 'util';
const configdb = require('./configdb');


const connection = mysql.createPool({
    host: configdb.host,
    user: configdb.user,
    password: configdb.password,
    database: configdb.database
});

connection.getConnection(
    (err, conn) => {
         if(err){
             console.log(err);
         }
         if(conn){
             console.log('DB conectada');
         }

         return;
    }
);

connection.query = promisify(connection.query);

module.exports = connection; 