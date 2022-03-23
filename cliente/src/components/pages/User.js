import React, { useContext, useState, useEffect } from 'react'
import { useNavigate } from "react-router-dom";
import preguntasContext from '../../context/preguntas/preguntasContext';
import usuarioContext from '../../context/usuario/usuarioContext';
import tablaContext from '../../context/tabla/tablaContext';
import styles from '../../styles/User.module.css'

const User = () => {

  let history = useNavigate()

  const [ nombre, setNombre ] = useState('')
  const [ casaIMG, setCasaIMG ] = useState();
  const [ error, setError ] = useState(false) 
  const [ casaName, setCasaName ] = useState('')
  const [ cargando, setCargando ] = useState(false)

  // OBTENER EL STATE DE PREGUNTA
  const preguntaContext = useContext(preguntasContext)
  const { acertadas, puntuacion } = preguntaContext;

  // OBTENER EL STATE DE USUARIO
  const usuariosContext = useContext(usuarioContext)
  const { usuarioCompleto, agregarUsuario } = usuariosContext;

  // OBTENER EL STATE DE TABLA
  const tablasContext = useContext(tablaContext)
  const { agregarJugador } = tablasContext;

  let usuario = {
    name    : nombre,
    casa      : casaIMG,
    acertadas : acertadas,
    puntuacion: puntuacion,
  }

  useEffect(() => {
    homeSelect()
  }, [])

  useEffect(() => {
    if(casaIMG === 1) {
      setCasaName('Gryffindor')
    } else if(casaIMG === 2){
      setCasaName('Hufflepuff')
    } else if(casaIMG === 3) {
      setCasaName('Ravenclaw')
    } else {
      setCasaName('Slytherin')
    }
  }, [casaIMG])
  
  

  const homeSelect = () => {
    let i = 0;
    const randomImage = setInterval(() => {
      i++
      setCasaIMG(i)
      if(i === 4) {
        i = 0;
      }
      const rand = 1000 + Math.random() * (10000 - 1000)

      setTimeout(() => {
        clearInterval(randomImage)
        return
      }, rand);
    }, 100);
  }

  const handleSubmit = e => {
    setCargando(true)
    // CANCELAR EL EVENTO DEFAULT DE EL SUBMIT
    e.preventDefault()

    // VALIDAR EL FORMULARIO
    if(nombre.trim() === '') {
      setError(true)
      setTimeout(() => {
        setError(false)
      }, 3500);
      return
    }

    // AGREGARLO AL REDUCER DE USUARIO
    agregarUsuario(usuario)

    setTimeout(() => {
      // AGREGARLO A DB
      agregarJugador(usuarioCompleto);
      setCargando(false)
      history('/tabla')
    }, 2000);
  }

  return (
    <div className={`contenedor ${styles.contenedoruser}`}>
      <header className={styles.header}>
        <img src='/img/logo.png' alt='Logo Quiz' className={styles.header__imagen}/>
      </header>

      <main className={styles.main}>
        <div className={styles.main__gorrobox}>
          <img src='/img/gorroseleccionador.png' alt='gorro seleccionador' className={styles.main__gorroimage}/>
          <h2 className={styles.main__titlegorro}>Sombrero Seleccionador</h2>

          <div className={styles.main__boxsorteocasa}>
            <img src={`/img/casa${casaIMG}.png`} alt='Casa' className={styles.main__imagecasa}/>
            <img src={`/img/casa${casaIMG}.png`} alt='Casa' className={styles.main__imagecasa}/>
            <img src={`/img/casa${casaIMG}.png`} alt='Casa' className={styles.main__imagecasa}/>
            <img src={`/img/casa${casaIMG}.png`} alt='Casa' className={styles.main__imagecasa}/>
          </div>
        </div>

        <form 
          className={styles.formulario}
          onSubmit={handleSubmit}  
        >
        {error ? <p>Debes rellenar el nombre correctamente</p> : null}
          <div className={styles.formulario__campo}>
            <label htmlFor='nombre' className={styles.formulario__label}>Nombre:</label>
            <input 
              type='text'
              name='nombre'
              id='nombre'
              className={styles.formulario__input}
              value={nombre}
              onChange={e => setNombre(e.target.value)}
            />
          </div>

          <div className={styles.formulario__campo}>
            <label htmlFor='nombre' className={styles.formulario__label}>Casa:</label>
            <input 
              type='text'
              name='nombre'
              id='nombre'
              disabled
              value={casaName}
              onChange={e => setCasaName(e.target.value)}
              className={styles.formulario__input}
            />
          </div>

          <input 
            type='submit'
            value='Enviar'
            className={styles.formulario__submit}
          />
        </form>
      </main>
    </div>
  )
}

export default User