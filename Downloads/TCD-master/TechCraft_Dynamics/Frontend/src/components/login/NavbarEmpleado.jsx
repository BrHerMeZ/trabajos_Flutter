import React from 'react';
import { useNavigate } from 'react-router-dom';

const NavbarEmpleado = () => {
  const navigate = useNavigate();

  const handleLogout = () => {
    localStorage.removeItem('token');
    localStorage.removeItem('rol');
    navigate('/');
  };

  return (
    <nav className="navbar navbar-expand-lg navbar-dark bg-primary px-3">
      <span className="navbar-brand">Panel del Empleado</span>

      <div className="ms-auto">
        <button className="btn btn-outline-light" onClick={handleLogout}>
          Cerrar sesión
        </button>
      </div>
    </nav>
  );
};

export default NavbarEmpleado;
