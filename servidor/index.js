const express = require('express');
const conectarDB = require('./config/db');
const cors = require('cors');

// CREAR EL SERVIDOR
const app = express();

// CONECTAR LA BASE DE DATOS
conectarDB();

// HABILITAR CORS
app.use(cors());

// HABILITAR EXPRESS:JSON
app.use( express.json({ extended: true }) );

// PUERTO DE LA APP
const PORT = process.env.PORT || 4000;

// IMPORTAR RUTAS
app.use('/api/tabla', require('./routes/tabla'));


// ARRANCAR LA APP
app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server running on port ${PORT}`);
});