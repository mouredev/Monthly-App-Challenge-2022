const mongoose = require('mongoose');

const JugadoresSchema = mongoose.Schema({
    name: {
        type: String, 
        required: true,
        trim: true
    },
    casa: {
        type: Number, 
        required: true,
    },
    acertadas: {
        type: Number, 
        required: true
    },
    puntuacion: {
        type: Number, 
        required: true
    },
    registro: {
        type: Date,
        default: Date.now()
    }
});

module.exports = mongoose.model('Jugadores', JugadoresSchema);
