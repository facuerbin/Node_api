//MySQL db connector
const mysql = require('mysql');

const pool = mysql.createPool({
    connectionLimit: 20,
    host: "localhost",
    user: "node",
    password: "NodeJS12$",
    database: "node_api"
});

module.exports = pool;