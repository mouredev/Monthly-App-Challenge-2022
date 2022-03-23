import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'

import Inicio from './components/pages/Inicio';
import Juego from './components/pages/Juego';
import Clasico from './components/pages/Clasico';
import User from './components/pages/User';
import LeaderBoard from './components/pages/LeaderBoard';

import PreguntasState from './context/preguntas/preguntasState';
import UsuarioState from './context/usuario/usuarioState';
import TablaState from './context/tabla/tablaState';

function App() {
  return (
    <PreguntasState>
      <UsuarioState>
        <TablaState>
          <Router>
            <Routes>
              <Route path='/' element={<Inicio />} />
              <Route path='/jugar' element={<Juego />} />
              <Route path='/jugar/clasico' element={<Clasico />} />
              <Route path='/jugar/finalizado' element={<User />} />
              <Route path='/tabla' element={<LeaderBoard />} />
            </Routes>
          </Router>
        </TablaState>
      </UsuarioState>
    </PreguntasState>
  );
}

export default App;
