const express = require('express');
const router = express.Router();
const tablaController = require('../controllers/tablaController');
const { check } = require('express-validator');

// AGREGAR UN USUARIO
// api/tabla
router.post('/',
    [
        check('name', 'El nombre es obligatorio').not().isEmpty(),
        check('puntuacion', 'Debes jugar antes de ponerte en la Tabla').not().isEmpty(),
        check('casa', 'El sombrero no te ha dado una casa, no eres digno').not().isEmpty(),
    ],
    tablaController.agregarJugador
)

// OBTENER TODOS LOS JUGADORES
router.get('/',
    tablaController.obtenerJugadores
)


module.exports = router;