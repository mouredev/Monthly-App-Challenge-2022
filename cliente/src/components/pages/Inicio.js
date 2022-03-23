import React from 'react'
import { Link } from "react-router-dom"
import Boton from '../utilidades/Boton'
import styles from '../../styles/Inicio.module.css'

const Inicio = () => {
  return (
    <div className={styles.contenedorinicio}>
        <header className={`${styles.header} contenedor`}>
            <div className={styles.header__contenido}>
                <img src='/img/logo.png' alt='Logo Quiz' className={styles.header__logo}/>
            </div>
        </header>

        <main className={`${styles.main} contenedor`}>
            <Link to='/jugar'>
                <Boton nombre={'Jugar'} imagen={'varita'}/>
            </Link>
            <Link to='/tabla'>
                <Boton nombre={'Tabla'} imagen={'leaderboard'}/>
            </Link>
        </main>

        <footer className={`${styles.footer} contenedor`}>
            <p>Developed with ❤️ from Asturias by Fran Mella</p>
        </footer>
    </div>
  )
}

export default Inicio