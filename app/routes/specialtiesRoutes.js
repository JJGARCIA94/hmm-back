const express = require('express');
const router = express.Router();
const specialtiesController = require('../controllers/specialtiesController');

router.get('/', specialtiesController.getSpecialties);

module.exports = router;