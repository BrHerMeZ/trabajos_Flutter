import { useState } from 'react';
import ToastNotification from '../components/ToastNotification'; // Importa el componente de notificación
import '../App.css';

function Login() {
  const [correo, setCorreo] = useState('');
  const [contrasena, setContrasena] = useState('');
  const [error, setError] = useState('');
  
  // Estados para el toast o alerta del inicio de sesión
  const [toast, setToast] = useState({
    isVisible: false, // Estado para controlar la visibilidad del toast
    message: '',
    type: 'success' 
  });

  const showToast = (message, type = 'success') => { // Función para mostrar el toast
    setToast({
      isVisible: true,
      message,
      type
    });
  };

  const hideToast = () => { // Función para ocultar el toast sin antes iniciar sesión
    setToast(prev => ({
      ...prev,
      isVisible: false
    }));
  };

  const getRoleName = (rol) => { // Función para traducir el rol al español
    const roles = {
      'Admin': 'Administrador',
      'Empleado': 'Empleado',
      'Personal': 'Personal'
    };
    return roles[rol] || rol; // Si el rol no está definido, devuelve el rol tal cual
  };

  const handleSubmit = async (e) => {
    e.preventDefault(); // Prevenir el comportamiento por defecto del formulario

    try {
      const response = await fetch('http://localhost:3000/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ correo, contrasena })
      });

      const data = await response.json();// Parsear la respuesta con un JSON

      if (response.ok) {
        // con esto se Guardar token y rol
        localStorage.setItem('token', data.token);// Guardar token en localStorage
        localStorage.setItem('rol', data.rol);// Guardar rol en localStorage

        //  Muestra el  toast de éxito
        const roleName = getRoleName(data.rol);
        showToast(`¡Bienvenido! Iniciaste sesión como ${roleName} `, 'success');

        // Redirigir después de mostrar el toast (con un pequeño delay)

        setTimeout(() => { // Redirigir a la página correspondiente según el rol escogido
          switch (data.rol) {
            case 'Admin':
              window.location.href = '/admin';
              break;
            case 'Empleado':
              window.location.href = '/empleado';
              break;
            case 'Personal':
              window.location.href = '/personal';
              break;
            default:
              setError('Rol no reconocido');
          }
        }, 1500); // Delay de 1.5 segundos para que se vea el toast

      } else {
        setError(data.error || 'Credenciales inválidas');
        showToast(data.error || 'Credenciales inválidas', 'error');
      }
    } catch (error) {
      console.error('Error al conectar:', error);
      const errorMessage = 'No se pudo conectar con el servidor';
      setError(errorMessage);
      showToast(errorMessage, 'error');
    }
  };

  return (
    <>
      {/* Toast Notification */}
      <ToastNotification
        message={toast.message}
        type={toast.type}
        isVisible={toast.isVisible}
        onClose={hideToast}
        duration={4000}
      />

      <div className="bg-shapes">
        <div className="shape"></div>
        <div className="shape"></div>
        <div className="shape"></div>
        <div className="shape"></div>
      </div>

      <div className="container-fluid vh-100 d-flex align-items-center justify-content-center">
        <div className="row w-100 justify-content-center">
          <div className="col-11 col-sm-8 col-md-6 col-lg-4 col-xl-3">
            <div className="form-container">
              <form onSubmit={handleSubmit}>
                <div className="text-center mb-4">
                  <div className="login-icon mb-3">
                    <i className="bi bi-shield-lock"></i>
                  </div>
                  <h1 className="fw-bold">Iniciar Sesión</h1>
                  <p className="text-muted">Ingresa tus credenciales para acceder al panel de administración</p>
                </div>

                {error && <div className="alert alert-danger">{error}</div>}

                <div className="input-group-custom mb-3">
                  <div className="input-icon">
                    <i className="bi bi-envelope"></i>
                  </div>
                  <input
                    type="email"
                    value={correo}
                    onChange={(e) => setCorreo(e.target.value)}
                    className="form-control form-control-custom"
                    placeholder="Correo electrónico"
                    required
                  />
                </div>

                <div className="input-group-custom mb-4">
                  <div className="input-icon">
                    <i className="bi bi-lock"></i>
                  </div>
                  <input
                    type="password"
                    value={contrasena}
                    onChange={(e) => setContrasena(e.target.value)}
                    className="form-control form-control-custom"
                    placeholder="Contraseña"
                    required
                  />
                </div>

                <button type="submit" className="btn btn-custom w-100 mb-3">
                  <span className="btn-text">Iniciar sesión</span>
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Login;