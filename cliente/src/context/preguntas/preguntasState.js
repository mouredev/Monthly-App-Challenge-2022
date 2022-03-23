import React, { useReducer } from 'react';
import preguntasContext from './preguntasContext'
import preguntasReducer from './preguntasReducer'

import preguntas from '../../components/data_preguntas/data';

import {
    OBTENER_PREGUNTAS,
    GUARDAR_PREGUNTAS,
    RESET_PREGUNTAS,
    GUARDAR_PUNTUACION,
    RESET_PUNTUACION,
} from '../../types';

import clienteAxios from '../../config/axios';

const PreguntasState = props => {

    const initialState = {
        preguntas  : [],
        acertadas  : null,
        puntuacion : null,
    }

    // DISPATCH PARA EJECUTAR LAS ACCIONES
    const [ state, dispatch ] = useReducer(preguntasReducer, initialState);

    const obtenerPreguntas = () => {
        try {
            // SELECCIONAMOS 10 PREGUNTAS ALEATORIA DE LA LISTA
            const preguntasLista = preguntas.sort(() => Math.random() - Math.random()).slice(0, 11);

            dispatch({
                type: OBTENER_PREGUNTAS,
                payload: preguntasLista
            })
        } catch (error) {
            console.log(error)
        }
    }

    const guardarPreguntasAcertadas = acertadas => {
        try {
            dispatch({
                type: GUARDAR_PREGUNTAS,
                payload: acertadas,
            })
        } catch (error) {
            console.log(error)
        }
    }

    const resetPreguntasAcertadas = () => {
        try {
            dispatch({
                type: RESET_PREGUNTAS,
            })
        } catch (error) {
            console.log(error)
        }
    }

    const guardarPuntuacion = puntuacion => {
        try {
            dispatch({
                type: GUARDAR_PUNTUACION,
                payload: puntuacion,
            })
        } catch (error) {
            console.log(error)
        }
    }

    const resetPuntuacion = () => {
        try {
            dispatch({
                type: RESET_PUNTUACION,
            })
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <preguntasContext.Provider
            value={{
                preguntas : state.preguntas,
                acertadas : state.acertadas,
                puntuacion: state.puntuacion,
                obtenerPreguntas,
                guardarPreguntasAcertadas,
                resetPreguntasAcertadas,
                guardarPuntuacion,
                resetPuntuacion,
            }}
        >
            {props.children}
        </preguntasContext.Provider>
    )
} 

export default PreguntasState
