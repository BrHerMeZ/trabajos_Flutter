// models/conexion.js
const mysql = require('mysql2/promise'); // Usa promesas correctamente

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '1099544210',
  database: 'techCraft',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = {pool};
