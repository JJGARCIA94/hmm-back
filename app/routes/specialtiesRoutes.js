const express = require('express');
const router = express.Router();
const specialtiesController = require('../controllers/specialtiesController');

router.get('/', specialtiesController.getSpecialties);
router.get('/:id', specialtiesController.getSpecialtyById);

module.exports = router;