const db = require('../../config/db');

exports.getSpecialties = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM specialties WHERE status = 1');
    res.json(rows);
  } catch (error) {
    console.error('Error en getSpecialties:', error);
    res.status(500).json({ error: 'Error en getSpecialties' });
  }
};

exports.getSpecialtyById = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await db.query('SELECT * FROM specialties WHERE id = ? AND status = 1', [id]);
    res.json(rows.length > 0 ? rows[0] : null);
  } catch (error) {
    console.error('Error en getSpecialtyById:', error);
    res.status(500).json({ error: 'Error en getSpecialtyById' });
  }
};