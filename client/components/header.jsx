import React from 'react';

function Header(props) {
  function handleMain() {
    props.setView('main', {});
  }
  function handleProfile() {
    props.setView('profile', {});
  }
  function handleNotification() {
    props.setView('notification', {});
  }
  return (
    <header className="mb d-flex align-items-center">
      <h2 className="head-title ml-4" onClick={handleMain}>Shred</h2>
      <div className="row justify-content-end col-8">
        <i className="far header-icon fa-newspaper mr-3" onClick={handleMain}></i>
        <i className="fas header-icon fa-snowboarding mr-3" onClick={handleProfile}></i>
        <i className="far header-icon fa-bell mr-2" onClick={handleNotification}></i>
      </div>
    </header>
  );
}
export default Header;
