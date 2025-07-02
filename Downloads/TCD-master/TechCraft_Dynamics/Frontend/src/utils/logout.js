import logout from '../utils/logout.js'; // Ajusta la ruta si es necesario


const logout = () => {// Función para manejar el cierre de sesión
  localStorage.removeItem('token');// Elimina el token del localStorage
  localStorage.removeItem('rol');// Elimina el rol del localStorage
  window.location.href = '/login'; // recarga total y evita navegación hacia atrás
};

export default logout;
