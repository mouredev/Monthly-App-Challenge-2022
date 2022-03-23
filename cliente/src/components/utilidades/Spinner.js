import React from 'react'
import '../../styles/spinner.css'

const Spinner = () => {
  return (
    <div className='contenedorspinner'>
        <div className="sk-chase">
            <div className="sk-chase-dot"></div>
            <div className="sk-chase-dot"></div>
            <div className="sk-chase-dot"></div>
            <div className="sk-chase-dot"></div>
            <div className="sk-chase-dot"></div>
            <div className="sk-chase-dot"></div>
        </div>
    </div>
  )
}

export default Spinner