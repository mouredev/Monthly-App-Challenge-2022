import React from 'react'
import styles from '../../styles/Boton.module.css'

const Boton = ({ nombre, imagen}) => {
  return (
      <button className={styles.boton}>
          {imagen ? (<img src={`/img/${imagen}.png`} alt={nombre} className={styles.boton__imagen}/>) : null}
          <p className={styles.boton__texto}>{nombre}</p>
      </button>
  )
}

export default Boton