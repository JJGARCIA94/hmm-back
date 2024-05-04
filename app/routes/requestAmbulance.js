const express = require('express');
const router = express.Router();
const requestAmbulanceController = require('../controllers/requestAmbulance');

router.post('/', requestAmbulanceController.requestAmbulance);

module.exports = router;