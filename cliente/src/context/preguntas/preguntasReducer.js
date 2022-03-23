import {
    OBTENER_PREGUNTAS,
    GUARDAR_PREGUNTAS,
    RESET_PREGUNTAS,
    GUARDAR_PUNTUACION,
    RESET_PUNTUACION,
} from '../../types';

export default (state, action) => {
    switch(action.type) {

        case OBTENER_PREGUNTAS:
            return {
                ...state,
                preguntas : action.payload
            }

        case GUARDAR_PREGUNTAS:
            return {
                ...state,
                acertadas : action.payload
            }

        case RESET_PREGUNTAS:
            return {
                ...state,
                acertadas : null
            }

        case GUARDAR_PUNTUACION:
            return {
                ...state,
                puntuacion : action.payload
            }

        case RESET_PUNTUACION:
            return {
                ...state,
                puntuacion : null
            }

        default:
            return state;
    }
}