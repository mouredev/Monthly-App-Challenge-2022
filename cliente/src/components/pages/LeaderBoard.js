import React, { useContext, useState, useEffect } from 'react'
import { Link } from "react-router-dom"
import Jugador from './Jugador';
import Boton from '../utilidades/Boton'
import Spinner from '../utilidades/Spinner';
import usuarioContext from '../../context/usuario/usuarioContext';
import tablaContext from '../../context/tabla/tablaContext';
import styles from '../../styles/LeaderBoard.module.css'

const LeaderBoard = () => {

  // OBTENER EL STATE DE USUARIO
  const usuariosContext = useContext(usuarioContext)
  const { resetUsuario } = usuariosContext;

  // OBTENER EL STATE DE TABLA
  const tablasContext = useContext(tablaContext)
  const { jugadores, obtenerJugadores } = tablasContext;

  const [ cargando, setCargando ] = useState(true)

  useEffect(() => {
    resetUsuario()
    obtenerJugadores()

    setTimeout(() => {
      setCargando(false)
    }, 3000);
  }, [])
  

  return (
    <>
    {cargando ? 
    (
    <div className='contenedorspinner'>
      <Spinner />
    </div>
    ) : (
      <div className={`contenedor`}>

      <header className={`${styles.header}`}>
        <div className={styles.header__contenido}>
          <Link to='/'>
            <Boton nombre={'Volver'}/>
          </Link>
          <img src='/img/logo.png' alt='Logo Quiz' className={styles.header__logo}/>
        </div>
      </header>

      <main className={styles.main}>

        <div className={styles.main__tablas}>
            <button className={`${styles.main__btn} ${styles.main__btnclasico}`}>Clasico</button>
        </div>


      <div className={styles.tabla__contenedorbody}>
        <table className={styles.tabla}>
          <thead className={styles.tabla__header}>
            <tr className={styles.tabla__headertr}>
              <td className={styles.tabla__headertd}>Posición</td>
              <td className={styles.tabla__headertd}>Casa</td>
              <td className={styles.tabla__headertd}>Nombre</td>
              <td className={styles.tabla__headertd}>Acertadas</td>
              <td className={styles.tabla__headertd}>Puntuación</td>
            </tr>
          </thead>
            <tbody className={styles.tabla__body}>
              {jugadores.map((jugador, index) => (
                <Jugador 
                  key={jugador.name}
                  index={index}
                  jugador={jugador}
                />
              ))}
            </tbody>
          
        </table>
      </div>

      </main>
    </div>
    )}
    </>
    
  )
}

export default LeaderBoard