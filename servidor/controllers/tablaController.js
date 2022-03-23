const Jugadores = require('../models/Jugadores');
const { validationResult } = require('express-validator');
const { default: mongoose } = require('mongoose');

// AÑADIR UN NUEVO USUARIO
exports.agregarJugador = async (req, res) => {
    // REVISAR SI HAY ERRORES
    const errores = validationResult(req);
    if ( !errores.isEmpty() ) {
        return res.status(400).json({ errores: errores.array() })
    }

    try {
        // EXTRAER EL JUGADOR Y COMPROBAR QUE EXISTE
        
        const existeUsuario = await Jugadores.find({ name : req.body.name });
        if(existeUsuario[0]) {
            req.body.name = req.body.name + ' ' + String(req.body.puntuacion);
        }

        // CREAR EL USUARIO
        const jugador = new Jugadores(req.body);
        await jugador.save();
        res.json({ jugador });
    } catch (error) {
        console.log(error);
        res.status(500).send('Ha ocurrido un error')
    }
}


// OBTIENE TODOS LOS JUGADORES
exports.obtenerJugadores = async (req, res) => {
    try {
        const jugadores = await Jugadores.find({}).sort({ puntuacion: -1 })
        res.json({ jugadores })

    } catch (error) {
        console.log(error);
        res.status(500).send('Ha ocurrido un error')
    }
}
