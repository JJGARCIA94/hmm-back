const express = require("express");
const bodyParser = require('body-parser');
const specialtiesRoutes = require('./app/routes/specialtiesRoutes');
const hospitalsRoutes = require('./app/routes/hospitalsRoutes');
const doctorsRoutes = require('./app/routes/doctorsRoutes');
const cors = require('cors');
const app = express();

app.use(bodyParser.json());
app.use(express.static('public'));
app.use(cors());

//rotues
app.use('/specialties', specialtiesRoutes);
app.use('/hospitals', hospitalsRoutes);
app.use('/doctors', doctorsRoutes);

app.listen(3000, () => {
    console.log('Server running on port 3000');
});