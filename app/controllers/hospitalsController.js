const db = require('../../config/db');

exports.getHospitals = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM hospitals WHERE status = 1');
    res.json(rows);
  } catch (error) {
    console.error('Error al obtener elementos:', error);
    res.status(500).json({ error: 'Error al obtener elementos' });
  }
};