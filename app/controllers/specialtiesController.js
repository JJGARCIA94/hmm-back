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

exports.getSpecialtiesPagination = async (req, res) => {
  try {
    const page = parseInt(req.params.page) || 1;
    const pageSize = 10;

    const offset = (page - 1) * pageSize;

    const [totalRows] = await db.query('SELECT COUNT(*) AS total FROM specialties WHERE STATUS = 1');
    const total = totalRows[0].total;

    const [rows] = await db.query('SELECT * FROM specialties WHERE status = 1 LIMIT ? OFFSET ?', [pageSize, offset]);
    res.json({
      result: rows,
      total: total
    });
  } catch (error) {
    console.error('Error en getSpecialtiesPagination:', error);
    res.status(500).json({ error: 'Error en getSpecialtiesPagination' });
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