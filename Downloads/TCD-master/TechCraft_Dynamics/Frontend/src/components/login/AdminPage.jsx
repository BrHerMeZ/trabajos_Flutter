import React from 'react';
import NavbarAdmin from './NavbarAdmin';

const AdminPage = () => {
  return (
    <div>
      <NavbarAdmin />
      <div className="container mt-4">
        <h2>Bienvenido al panel de administración</h2>
        {/* Aquí va todo lo demás */}
      </div>
    </div>
  );
};

export default AdminPage;
 