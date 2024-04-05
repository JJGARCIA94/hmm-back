const express = require('express');
const router = express.Router();
const hospitalsController = require('../controllers/hospitalsController');

router.get('/', hospitalsController.getHospitals);

module.exports = router;