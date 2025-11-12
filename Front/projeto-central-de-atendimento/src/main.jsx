import { StrictMode } from 'react'
import { createRoot, BrowserRouter, Routes, Route } from 'react-dom/client'
import Login from './pages/Login.jsx'
import TelaPrincipal from './pages/TelaPrincipal.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
      <Routes>
        <Route path="/pages" element={<Login />} />
        <Route path="/pages" element={<TelaPrincipal />} />
      </Routes>
  </StrictMode>
)
