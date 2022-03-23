import {
    AGREGAR_USUARIO,
    RESET_USUARIO,
} from '../../types';

export default (state, action) => {
    switch(action.type) {

        case AGREGAR_USUARIO:
            return {
                ...state,
                usuarioCompleto: action.payload
            }

        case RESET_USUARIO:
            return {
                ...state,
                usuarioCompleto : [],
            }

        default:
            return state;
    }
}