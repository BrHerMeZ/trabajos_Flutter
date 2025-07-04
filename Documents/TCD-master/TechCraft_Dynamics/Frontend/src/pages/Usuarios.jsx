import React, { useEffect, useState } from 'react';
import axios from 'axios';
import UsuarioForm from '../components/UsuarioForm.jsx';

const Usuarios = () => {
  const [usuarios, setUsuarios] = useState([]);
  const [usuarioEditado, setUsuarioEditado] = useState(null);
  const [mostrarFormulario, setMostrarFormulario] = useState(false);


  const cargarUsuarios = async () => {
    try {
      const res = await axios.get('http://localhost:3000/api/usuarios');
      setUsuarios(res.data);
    } catch (error) {
      console.error('Error al cargar usuarios:', error);
    }
  };

  useEffect(() => {
    cargarUsuarios();
  }, []);

  const handleEditar = (usuario) => {
    setUsuarioEditado(usuario);
    setMostrarFormulario(true);
  };

  const handleEliminar = async (id) => {
    try {
      await axios.delete(`http://localhost:3000/api/usuarios/${id}`);
      cargarUsuarios(); 
    } catch (error) {
      console.error('Error al eliminar usuario:', error);
    }
  };

  const handleNuevo = () => {
    setUsuarioEditado(null);
    setMostrarFormulario(true);
  };

  const handleGuardar = () => {
    setMostrarFormulario(false);
    cargarUsuarios();
  };

  return (
    <div className="container">
      <h2>Gestión de Usuarios</h2>
      <button className="btn btn-primary" onClick={handleNuevo}>➕ Nuevo Usuario</button>

      {mostrarFormulario && (
        <UsuarioForm
          usuario={usuarioEditado}
          onGuardar={handleGuardar}
          onCancelar={() => setMostrarFormulario(false)}
        />
      )}

      <table className="table table-striped mt-3">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Correo</th>
            <th>Rol</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {usuarios.map((u) => (
            <tr key={u.id}>
              <td>{u.id}</td>
              <td>{u.Nombres}</td>
              <td>{u.Apellidos}</td>
              <td>{u.Correo_personal}</td>
              <td>{u.id_Rol}</td>
              <td>
                <button className="btn btn-warning btn-sm me-2" onClick={() => handleEditar(u)}> Editar</button>
                <button className="btn btn-danger btn-sm" onClick={() => handleEliminar(u.id)}> Eliminar</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Usuarios;
