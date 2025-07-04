import React, { useState, useEffect } from 'react';
import axios from 'axios';

const UsuarioForm = ({ usuario, onGuardar, onCancelar }) => {
  const [formData, setFormData] = useState({
    Nombres: '',
    Apellidos: '',
    Contrasena: '',
    Tipo_documento: '',
    Numero_documento: '',
    Numero_celular: '',
    Correo_personal: '',
    Correo_empresarial: '',
    id_Rol: 1
  });

  useEffect(() => {
    if (usuario) {
      // Si estamos editando, cargamos los datos (menos la contraseña)
      const { Contrasena, ...datos } = usuario;
      setFormData({ ...datos, Contrasena: '' });
    }
  }, [usuario]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (usuario) {
        // PUT – Editar
        await axios.put(`http://localhost:3000/api/usuarios/${usuario.id}`, formData);
      } else {
        // POST – Crear
        await axios.post('http://localhost:3000/api/usuarios', formData);
      }
      onGuardar();
    } catch (error) {
      console.error('Error al guardar usuario:', error);
    }
  };

  return (
    <div className="card mt-3">
      <div className="card-body">
        <h5 className="card-title">{usuario ? 'Editar Usuario' : 'Nuevo Usuario'}</h5>
        <form onSubmit={handleSubmit}>
          <div className="row">
            <div className="col-md-6 mb-2">
              <input
                type="text"
                className="form-control"
                name="Nombres"
                placeholder="Nombres"
                value={formData.Nombres}
                onChange={handleChange}
                required
              />
            </div>

            <div className="col-md-6 mb-2">
              <input
                type="text"
                className="form-control"
                name="Apellidos"
                placeholder="Apellidos"
                value={formData.Apellidos}
                onChange={handleChange}
                required
              />
            </div>

            {!usuario && (
              <div className="col-md-6 mb-2">
                <input
                  type="password"
                  className="form-control"
                  name="Contrasena"
                  placeholder="Contraseña"
                  value={formData.Contrasena}
                  onChange={handleChange}
                  required
                />
              </div>
            )}

            <div className="col-md-6 mb-2">
              <input
                type="text"
                className="form-control"
                name="Tipo_documento"
                placeholder="Tipo de documento"
                value={formData.Tipo_documento}
                onChange={handleChange}
              />
            </div>

            <div className="col-md-6 mb-2">
              <input
                type="text"
                className="form-control"
                name="Numero_documento"
                placeholder="Número de documento"
                value={formData.Numero_documento}
                onChange={handleChange}
              />
            </div>

            <div className="col-md-6 mb-2">
              <input
                type="text"
                className="form-control"
                name="Numero_celular"
                placeholder="Celular"
                value={formData.Numero_celular}
                onChange={handleChange}
              />
            </div>

            <div className="col-md-6 mb-2">
              <input
                type="email"
                className="form-control"
                name="Correo_personal"
                placeholder="Correo personal"
                value={formData.Correo_personal}
                onChange={handleChange}
              />
            </div>

            <div className="col-md-6 mb-2">
              <input
                type="email"
                className="form-control"
                name="Correo_empresarial"
                placeholder="Correo empresarial"
                value={formData.Correo_empresarial}
                onChange={handleChange}
              />
            </div>

            <div className="col-md-3 mb-2">
              <input
                type="number"
                className="form-control"
                name="id_Rol"
                placeholder="ID Rol"
                value={formData.id_Rol}
                onChange={handleChange}
              />
            </div>
          </div>

          <button type="submit" className="btn btn-success me-2">
            {usuario ? 'Actualizar' : 'Guardar'}
          </button>
          <button type="button" className="btn btn-secondary" onClick={onCancelar}>
            Cancelar
          </button>
        </form>
      </div>
    </div>
  );
};

export default UsuarioForm;
