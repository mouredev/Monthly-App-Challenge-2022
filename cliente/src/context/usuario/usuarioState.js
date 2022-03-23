import React, { useReducer } from 'react';
import usuarioContext from './usuarioContext'
import usuarioReducer from './usuarioReducer'

import {
    AGREGAR_USUARIO,
    RESET_USUARIO,
} from '../../types';

const UsuarioState = props => {

    const initialState = {
        usuarioCompleto : []
    }

    // DISPATCH PARA EJECUTAR LAS ACCIONES
    const [ state, dispatch ] = useReducer(usuarioReducer, initialState);

    const agregarUsuario = usuario => {
        try {
            dispatch({
                type: AGREGAR_USUARIO,
                payload : usuario,
            })
        } catch (error) {
            console.log(error)
        }
    }

    const resetUsuario = () => {
        try {
            dispatch({
                type: RESET_USUARIO
            })
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <usuarioContext.Provider
            value={{
                usuarioCompleto: state.usuarioCompleto,
                agregarUsuario,
                resetUsuario,
            }}
        >
            {props.children}
        </usuarioContext.Provider>
    )
} 

export default UsuarioState
