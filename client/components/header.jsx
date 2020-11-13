import React from 'react';

function Header(props) {
  function handleMain() {
    props.setView('main', {});
  }
  function handleProfile() {
    props.setView('profile', {});
  }

  return (
    <header className="mb d-flex align-items-center">
      <h2 className="head-title ml-4" onClick={handleMain}>Shred</h2>
      <div className="row justify-content-end col-8">
        <i className="fas fa-snowboarding mr-3" onClick={handleProfile}></i>
        <i className="far fa-bell mr-2"></i>
      </div>
    </header>
  );
}
export default Header;
