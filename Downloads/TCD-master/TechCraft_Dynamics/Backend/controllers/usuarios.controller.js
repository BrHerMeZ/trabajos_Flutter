const db = require('../models/conexion');


const crearUsuarios = (req, res) => {
  const { Nombres, Apellidos, Contrasena, Tipo_documento, Numero_documento, Numero_celular, Correo_personal, Correo_empresarial } = req.body;
  const query = `
    INSERT INTO Usuarios (Nombres, Apellidos, Contrasena, Tipo_documento, Numero_documento, Numero_celular, Correo_personal, Correo_empresarial)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
  const values = [Nombres, Apellidos, Contrasena, Tipo_documento, Numero_documento, Numero_celular, Correo_personal, Correo_empresarial];

  db.query(query, values, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ id: result.insertId });
  });
};

const listarUsuarios = (req, res) => {
  db.query("SELECT * FROM Usuarios", (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
};

const actualizarUsuarios = (req, res) => {
  const { id } = req.params;
  const { Nombres, Apellidos, Contrasena, Tipo_documento, Numero_documento, Numero_celular, Correo_personal, Correo_empresarial } = req.body;
  const query = `
    UPDATE Usuarios 
    SET Nombres=?, Apellidos=?, Contrasena=?, Tipo_documento=?, Numero_documento=?, Numero_celular=?, Correo_personal=?, Correo_empresarial=?
    WHERE id=?`;
  const values = [Nombres, Apellidos, Contrasena, Tipo_documento, Numero_documento, Numero_celular, Correo_personal, Correo_empresarial, id];

  db.query(query, values, (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Usuario actualizado correctamente' });
  });
};

const eliminarUsuarios = (req, res) => {
  const { id } = req.params;
  db.query("DELETE FROM Usuarios WHERE id = ?", [id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Usuario eliminado correctamente' });
  });
};

module.exports = {
  crearUsuarios,
  listarUsuarios,
  actualizarUsuarios,
  eliminarUsuarios
};
