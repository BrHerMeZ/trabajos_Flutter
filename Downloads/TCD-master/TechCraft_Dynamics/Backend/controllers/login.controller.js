const { pool } = require('../models/conexion'); // Ajusta la ruta si tu archivo no se llama `db.js` o está en otra carpeta
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const dotenv = require("dotenv");

dotenv.config(); // Asegúrate de cargar las variables de entorno
console.log("JWT_SECRET:", process.env.JWT_SECRET);

const loginUser = async (req, res) => {
  const { correo, contrasena } = req.body;

  try {
    const [rows] = await pool.query(`
      SELECT u.*, r.nombreRol 
      FROM Usuarios u
      JOIN Roles r ON u.id_Rol = r.id
      WHERE u.Correo_personal = ? OR u.Correo_empresarial = ?
    `, [correo, correo]); 

    if (rows.length === 0) { 
      return res.status(401).json({ error: "Usuario no encontrado" });
    }

    const usuario = rows[0];
    const match = await bcrypt.compare(contrasena, usuario.Contrasena);

    if (!match) {
      return res.status(401).json({ error: "Contraseña incorrecta" });
    }

    const token = jwt.sign(
      {
        id: usuario.id,
        correo: usuario.Correo_empresarial,
        rol: usuario.nombreRol
      },
      process.env.JWT_SECRET,
      { expiresIn: "2h" }
    );

    return res.json({
      message: "Login exitoso",
      token: token,
      rol: usuario.nombreRol
    });

  } catch (err) {
    console.error("Error en login:", err);
    res.status(500).json({ error: "Error del servidor" });
  }
};

module.exports = { loginUser };
