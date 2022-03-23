import {
    AGREGAR_JUGADOR,
    OBTENER_JUGADORES,
} from '../../types';

export default (state, action) => {
    switch(action.type) {

        case AGREGAR_JUGADOR:
            return {
                ...state,
                jugadores: [...state.jugadores, action.payload],
            }

        case OBTENER_JUGADORES:
            return {
                ...state,
                jugadores: action.payload
            }

        default:
            return state;
    }
}