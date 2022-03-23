import React, { useContext, useState, useEffect } from 'react'
import Spinner from '../utilidades/Spinner';
import { useNavigate } from "react-router-dom";
import preguntasContext from '../../context/preguntas/preguntasContext'
import usuarioContext from '../../context/usuario/usuarioContext';
import styles from '../../styles/Clasico.module.css'

const Clasico = () => {

  let history = useNavigate()

  // OBTENER EL STATE DE PREGUNTA
  const preguntaContext = useContext(preguntasContext)
  const { preguntas, obtenerPreguntas, guardarPreguntasAcertadas, resetPreguntasAcertadas, guardarPuntuacion, resetPuntuacion } = preguntaContext;

  // OBTENER EL STATE DE USUARIO
  const userContext = useContext(usuarioContext)
  const { agregarUsuario, resetUsuario } = userContext;

  const [ pregunta, setPregunta ] = useState(0)
  const [ cargando, setCargando ] = useState(true);
  const [ correcta, setCorrecta ] = useState();
  const [ respuesta, setRespuesta ] = useState('');
  const [ clase, setClase ] = useState('')
  const [ timeLeft, setTimeLeft ] = useState(30); 
  const [ timer, setTimer ] = useState();
  const [ puntuacion, setPuntuacion ] = useState(0);
  const [ acertadas , setAcertadas ] = useState(0);

  useEffect(() => {
    resetPreguntasAcertadas()
    resetPuntuacion()
    resetUsuario()
    obtenerPreguntas()
  }, [])
  

  useEffect(() => {
    if(pregunta === 10) {
      guardarPreguntasAcertadas(acertadas)
      guardarPuntuacion(puntuacion)
      history('/jugar/finalizado')
    }
    setTimeLeft(30)
    
    setTimeout(() => {
      setCargando(false)
      start()
    }, 1500);
  }, [pregunta])

  const start = () => {
    const timer = setInterval(() => {
      setTimeLeft((timeLeft) => timeLeft - 1);

      if(timeLeft === 0) {
        clearInterval(timer)
      } 
    }, 1000)
    setTimer(timer)
  }

  useEffect(() => {
    if(timeLeft === 0) {
      clearInterval(timer)
      setClase('noacertado')
      setRespuesta(`${preguntas[pregunta].correct}`)

      setTimeout(() => {
        setPregunta(pregunta + 1)
        setRespuesta('')
        setCorrecta('')
        setClase('')
        setCargando(true)
      }, 5000);
    }
  }, [timeLeft, timer])

  useEffect(() => {
    return () => clearInterval(timer);
  }, [timer]);
  
  

  const corregirPregunta = (x, e) => {
    if(clase !== '') return;

    clearInterval(timer)

    if(preguntas[pregunta].correct === x) {
      if(puntuacion === 0) {
        setPuntuacion(timeLeft)
      } else {
        setPuntuacion(puntuacion + timeLeft)
      }
      setClase('acertado');
      setAcertadas(acertadas + 1)
    } else {
      setClase('noacertado');
    }
    setCorrecta(preguntas[pregunta].correct)
    setRespuesta(`${x}`)

    setTimeout(() => {
      setPregunta(pregunta + 1)
      setRespuesta('')
      setCorrecta('')
      setClase('')
      setCargando(true)
    }, 5000);
  }
  
  return (
    <>
    {!cargando ? (
        <div className={styles.contenedorclasico}>
          <header className={styles.header}>
            <div className={`${styles.header__contenedorpregunta} contenedor`}>
              <p className={styles.header__contadorpregunta}>{pregunta + 1}/10</p>
              <p className={styles.header__pregunta}>{preguntas[pregunta].pregunta}</p>
            </div>
          </header>
    
          <main className={`${styles.main} contenedor`}>
            <div className={styles.main__data}>
              <p className={styles.main__timer}>{timeLeft}</p>
              <img src={preguntas[pregunta].imagen} alt='Imagen Pregunta' className={styles.main__image}/>
              <p className={styles.main__puntos}>{puntuacion}<span className={styles.main__puntossalto}>puntos</span></p>
            </div>
    
            <div className={styles.main__respuestas}>
              {correcta === 1 ? (
                <button 
                className='acertado'
                onClick={(e) => corregirPregunta(1,e)}
                >
                  A) {preguntas[pregunta].respuestas[0]}
                </button>
              ) : (
                <button 
                className={respuesta === '1' ? clase : styles.respuesta}
                onClick={(e) => corregirPregunta(1,e)}
                >
                  A) {preguntas[pregunta].respuestas[0]}
                </button>
              ) }

              {correcta === 2 ? (
                <button 
                className='acertado'
                onClick={(e) => corregirPregunta(2,e)}
                >
                  B) {preguntas[pregunta].respuestas[1]}
                </button>
              ) : (
                <button 
                className={respuesta === '2' ? clase: styles.respuesta}
                onClick={(e) => corregirPregunta(2,e)}
              >
                B) {preguntas[pregunta].respuestas[1]}
              </button>
              ) }
            
              {correcta === 3 ? (
                <button 
                className='acertado'
                onClick={(e) => corregirPregunta(3,e)}
              >
                C) {preguntas[pregunta].respuestas[2]}
              </button>
              ) : (
                <button 
                className={respuesta === '3' ? clase : styles.respuesta}
                onClick={(e) => corregirPregunta(3,e)}
                >
                  C) {preguntas[pregunta].respuestas[2]}
                </button>
              ) }
            </div>
          </main>
        </div>
      ) : <Spinner />}  
    </>
    
  )
}

export default Clasico