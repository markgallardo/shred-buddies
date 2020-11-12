import React from 'react';

function Header(props) {

  return (
    <header className="mb d-flex align-items-center">
      <h2 className="head-title ml-4">Shred</h2>
      <div className="row justify-content-end col-8">
        <i className="fas fa-snowboarding mr-3"></i>
        <i className="far fa-bell mr-2"></i>
      </div>
    </header>
  );
}
export default Header;
