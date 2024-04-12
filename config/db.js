const mysql = require('mysql2/promise');
const { DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE, DB_PORT } = require('./const');

// Configuración de la conexión a la base de datos
const pool = mysql.createPool({
  host: DB_HOST,       // Dirección del servidor de la base de datos
  user: DB_USER,         // Nombre de usuario de la base de datos
  password: DB_PASSWORD,  // Contraseña de la base de datos
  database: DB_DATABASE, // Nombre de la base de datos
  port: DB_PORT,
  waitForConnections: true,
  connectionLimit: 20,
  queueLimit: 0
});

module.exports = pool;