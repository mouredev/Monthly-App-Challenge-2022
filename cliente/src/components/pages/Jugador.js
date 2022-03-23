import React from 'react'
import styles from '../../styles/LeaderBoard.module.css'

const Jugador = ({ jugador, index }) => {
  return (
    <tr className={styles.tabla__bodytr}>
        <td className={styles.tabla__bodytd}>{index + 1}</td>
        <td className={styles.tabla__bodytd}><img src={`/img/casa${jugador.casa}.png`} alt='Casa' className={styles.tabla__imagencasa}/></td>
        <td className={styles.tabla__bodytd}>{jugador.name}</td>
        <td className={styles.tabla__bodytd}>{jugador.acertadas}/10</td>
        <td className={styles.tabla__bodytd}>{jugador.puntuacion}</td>
    </tr>
  )
}

export default Jugador