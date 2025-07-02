const express = require('express');
const router = express.Router();

const UsuariosCtrl = require('../controllers/usuarios.controller');

// Rutas
router.get('/', UsuariosCtrl.listarUsuarios);
router.post('/', UsuariosCtrl.crearUsuarios);
router.put('/:id', UsuariosCtrl.actualizarUsuarios);  // ← nombre correcto
router.delete('/:id', UsuariosCtrl.eliminarUsuarios); // ← nombre correcto

module.exports = router;
