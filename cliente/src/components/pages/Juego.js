import React from 'react'
import { Link } from "react-router-dom"
import Boton from '../utilidades/Boton'
import styles from '../../styles/Juego.module.css'

const Juego = () => {
  return (
    <div className='contenedor'>

      <header className={`${styles.header}`}>
        <div className={styles.header__contenido}>
          <Link to='/'>
            <Boton nombre={'Volver'}/>
          </Link>
          <img src='/img/logo.png' alt='Logo Quiz' className={styles.header__logo}/>
        </div>
      </header>

      <main className={styles.main}>
        <div className={styles.main__contenido}>
          <div className={styles.card}>
            <div className={styles.card__textos}>
              <h2 className={styles.card__heading}>Clasico</h2>
              <div className={styles.card__separador}></div>
              <ul className={styles.card__lista}>
                <li className={styles.card__listaitem}>10 preguntas con 30 segundos para resolver.</li>
                <li className={styles.card__listaitem}>Cada pregunta tiene 3 posibles respuestas.</li>
                <li className={styles.card__listaitem}>El tiempo restante de la pregunta al acertarla será la puntuación a acumular</li>
                <li className={styles.card__listaitem}>Si se acaba el tiempo, pregunta nula.</li>
              </ul>
            </div>

            <Link to='/jugar/clasico'>
              <div className={styles.card__boton}>
                <Boton nombre={'Empezar'}/>
              </div>
            </Link>
          </div>
        </div>
      </main>

    </div>
  )
}

export default Juego