import React, { useReducer } from 'react';
import tablaContext from './tablaContext'
import tablaReducer from './tablaReducer'

import {
    AGREGAR_JUGADOR,
    OBTENER_JUGADORES,
} from '../../types';

import clienteAxios from '../../config/axios';

const TablaState = props => {

    const initialState = {
        jugadores : [],
    }

    // DISPATCH PARA EJECUTAR LAS ACCIONES
    const [ state, dispatch ] = useReducer(tablaReducer, initialState);

    const agregarJugador = async usuario => {
        try {
            const resultado = await clienteAxios.post('/api/tabla', usuario)
            // INSERTAR EL PROYECTO EN EL STATE
            dispatch({
                type: AGREGAR_JUGADOR,
                payload: resultado.data
            })
        } catch (error) {
            console.log(error)
        }
    }

    const obtenerJugadores = async () => {
        try {
            const resultado = await clienteAxios.get('/api/tabla');
            dispatch({
                type: OBTENER_JUGADORES,
                payload: resultado.data.jugadores
            })
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <tablaContext.Provider
            value={{
                jugadores : state.jugadores,
                agregarJugador,
                obtenerJugadores,
            }}
        >
            {props.children}
        </tablaContext.Provider>
    )
} 

export default TablaState
