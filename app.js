const express = require("express");
const bodyParser = require('body-parser');
const specialtiesRoutes = require('./app/routes/specialtiesRoutes');
const hospitalsRoutes = require('./app/routes/hospitalsRoutes');
const doctorsRoutes = require('./app/routes/doctorsRoutes');
const cors = require('cors');
const { PORT } = require("./config/const");
const app = express();

require('dotenv').config();

app.use(bodyParser.json());
app.use(express.static('public'));
app.use(cors());

//routes
app.use('/specialties', specialtiesRoutes);
app.use('/hospitals', hospitalsRoutes);
app.use('/doctors', doctorsRoutes);

app.listen(PORT, () => {
    console.log('Server running on port '+PORT);
});