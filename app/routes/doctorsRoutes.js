const express = require('express');
const router = express.Router();
const doctorsController = require('../controllers/doctorsController');

router.get('/', doctorsController.getDoctors);
router.post('/searchDoctors/:idSpeciality/:idHospital', doctorsController.getsearchDoctors);

module.exports = router;