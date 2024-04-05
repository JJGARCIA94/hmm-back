const mysql = require('mysql2/promise');

// Configuración de la conexión a la base de datos
const pool = mysql.createPool({
  host: 'localhost',       // Dirección del servidor de la base de datos
  user: 'root',         // Nombre de usuario de la base de datos
  password: '',  // Contraseña de la base de datos
  database: 'hmm', // Nombre de la base de datos
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = pool;