require('dotenv').config();
console.log("JWT_SECRET desde index.js:", process.env.JWT_SECRET); // Esta línea es para ver si carga bien

const express = require('express');
const cors = require('cors');
const session = require('express-session');
const path = require('path');

// Rutas
const LoginRoutes = require('./routes/login.routes');
const UsuariosRoutes = require('./routes/usuarios.routes');
const VentasRoutes = require('./routes/ventas.routes');
const ProductosRoutes = require('./routes/productos.routes');
const ProveedoresRoutes = require('./routes/proveedores.routes');

const app = express();

// Middlewares
app.use(cors({
  origin: 'http://localhost:5173', // Cambia esto al origen de tu frontend
  credentials: true // Permite enviar cookies y encabezados de autorización
}));
app.use(session({ 
  secret: 'techcraft_secret_key', 
  resave: false,
  saveUninitialized: false
}));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Sesiones
app.use(session({
  secret: 'techcraft_secret_key',
  resave: false,
  saveUninitialized: false
}));

// Rutas principales
app.use('/api/ventas', VentasRoutes);
app.use('/api/productos', ProductosRoutes);
app.use('/api/proveedores', ProveedoresRoutes);
app.use('/api/usuarios', UsuariosRoutes);
app.use('/api/login', LoginRoutes);

// Iniciar servidor
app.listen(3000, () => {
  console.log('Servidor backend corriendo en http://localhost:3000');
});
