const db = require('../../config/db');
const { replaceStrTwoCharacters } = require('../../utils/stringsUtil');

exports.getDoctors = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM doctors');
    res.json(rows);
  } catch (error) {
    console.error('Error en getDoctors:', error);
    res.status(500).json({ error: 'Error en getDoctors' });
  }
};

exports.getsearchDoctors = async (req, res) => {
  try {
    const { idSpeciality, idHospital } = req.params;
    const { doctor } = req.body;
    const separator = ';';
    const strReplace = ', '
    const strLastReplace = ' y ';

    const page = parseInt(req.body.page) || 1;
    const pageSize = 10;

    const offset = (page - 1) * pageSize;

    let query = `SELECT COUNT(*) AS total FROM (SELECT doctors.*, specialties.specialties, specialties.derivations, studies.studies, procedures.procedures, courses.courses FROM doctors INNER JOIN specialties_doctor ON specialties_doctor.idDoctor = doctors.id LEFT JOIN (SELECT idDoctor, GROUP_CONCAT(specialties.name SEPARATOR ?) AS specialties, GROUP_CONCAT(specialties.derivation SEPARATOR ';') AS derivations FROM specialties_doctor LEFT JOIN specialties ON specialties.id = specialties_doctor.idSpecialty GROUP BY idDoctor) AS specialties ON specialties.idDoctor = doctors.id LEFT JOIN (SELECT idDoctor, GROUP_CONCAT(studies_doctors.description SEPARATOR ?) AS studies FROM studies_doctors GROUP BY idDoctor) AS studies ON studies.idDoctor = doctors.id LEFT JOIN (SELECT idDoctor, GROUP_CONCAT(procedures_doctors.description SEPARATOR ?) AS procedures FROM procedures_doctors GROUP BY idDoctor) AS procedures ON procedures.idDoctor = doctors.id LEFT JOIN (SELECT idDoctor, GROUP_CONCAT(courses_doctors.description SEPARATOR ?) AS courses FROM courses_doctors GROUP BY idDoctor) AS courses ON courses.idDoctor = doctors.id WHERE doctors.status = 1`;

    const queryParams1 = [separator, separator, separator, separator];

    if (parseInt(idSpeciality) !== 0) {
      query += ' AND specialties_doctor.idSpecialty = ?';
      queryParams1.push(idSpeciality);
    }

    if (parseInt(idHospital) !== 0) {
      query += ' AND specialties_doctor.idHospital = ?';
      queryParams1.push(idHospital);
    }

    if (doctor !== '') {
      query += ` AND (LOWER(doctors.names) LIKE CONCAT('%', LOWER(?), '%') OR LOWER(doctors.lastName) LIKE CONCAT('%', LOWER(?), '%') OR LOWER(doctors.secondSurname) LIKE CONCAT('%', LOWER(?), '%'))`;
      queryParams1.push(doctor, doctor, doctor);
    }

    query += `) AS totalRows;`;

    const [totalRows] = await db.query(query, queryParams1);
    const total = totalRows[0].total;

    query = `SELECT doctors.*, specialties.specialties, specialties.derivations, studies.studies, procedures.procedures, courses.courses FROM doctors INNER JOIN specialties_doctor ON specialties_doctor.idDoctor = doctors.id LEFT JOIN (SELECT idDoctor, GROUP_CONCAT(specialties.name SEPARATOR ?) AS specialties, GROUP_CONCAT(specialties.derivation SEPARATOR ';') AS derivations FROM specialties_doctor LEFT JOIN specialties ON specialties.id = specialties_doctor.idSpecialty GROUP BY idDoctor) AS specialties ON specialties.idDoctor = doctors.id LEFT JOIN (SELECT idDoctor, GROUP_CONCAT(studies_doctors.description SEPARATOR ?) AS studies FROM studies_doctors GROUP BY idDoctor) AS studies ON studies.idDoctor = doctors.id LEFT JOIN (SELECT idDoctor, GROUP_CONCAT(procedures_doctors.description SEPARATOR ?) AS procedures FROM procedures_doctors GROUP BY idDoctor) AS procedures ON procedures.idDoctor = doctors.id LEFT JOIN (SELECT idDoctor, GROUP_CONCAT(courses_doctors.description SEPARATOR ?) AS courses FROM courses_doctors GROUP BY idDoctor) AS courses ON courses.idDoctor = doctors.id WHERE doctors.status = 1`;
    const queryParams = [separator, separator, separator, separator];

    if (parseInt(idSpeciality) !== 0) {
      query += ' AND specialties_doctor.idSpecialty = ?';
      queryParams.push(idSpeciality);
    }

    if (parseInt(idHospital) !== 0) {
      query += ' AND specialties_doctor.idHospital = ?';
      queryParams.push(idHospital);
    }

    if (doctor !== '') {
      query += ` AND (LOWER(doctors.names) LIKE CONCAT('%', LOWER(?), '%') OR LOWER(doctors.lastName) LIKE CONCAT('%', LOWER(?), '%') OR LOWER(doctors.secondSurname) LIKE CONCAT('%', LOWER(?), '%'))`;
      queryParams.push(doctor, doctor, doctor);
    }

    query += ` GROUP BY doctors.id LIMIT ${pageSize} OFFSET ${offset};`;

    const [rows] = await db.query(query, queryParams);
    rows.forEach(row => {
      row.specialties = row.specialties?.split(separator);
      row.derivations = replaceStrTwoCharacters(row.derivations, separator, strReplace, strLastReplace);
      row.studies = row.studies?.split(separator);
      row.procedures = row.procedures?.split(separator);
      row.courses = row.courses?.split(separator);
    });

    res.json({
      result: rows,
      total: total
    });
  } catch (error) {
    console.error('Error en getsearchDoctors:', error);
    res.status(500).json({ error: 'Error en getsearchDoctors' });
  }
};