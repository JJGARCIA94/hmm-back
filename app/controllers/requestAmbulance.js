const db = require('../../config/db');
const nodemailer = require("nodemailer");

exports.requestAmbulance = async (req, res) => {
  try {
    const {urlMap} = req.body;

    await nodemailer.createTestAccount();

    let transporter = nodemailer.createTransport({
      host: "smtp.gmail.com",
      port: 465,
      secure: true,
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASSWORD,
      },
    });

    await transporter.sendMail({
      from: "Solicitud de ambulancia<foo@example.com>",
      to: process.env.EMAIL_RECEIVER,
      subject: `Hospital Marina Mazatlán`,
      text: `Solicitud de ambulancia`,
      html:
        "<div>" +
        "<h3>" +
        "Solicitud de ambulancia <a href='" +
        urlMap +
        "' target='_blank' rel='noreferrer'>aquí</a>" +
        "</h3>" +
        "</div>",
    });

    /* const [rows] = await db.query('SELECT * FROM specialties WHERE status = 1'); */
    res.json([]);
  } catch (error) {
    console.error('Error en requestAmbulance:', error);
    res.status(500).json({ error: 'Error en requestAmbulance' });
  }
};