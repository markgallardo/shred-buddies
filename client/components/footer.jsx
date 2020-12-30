import React from 'react';

function Footer(props) {
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
    <div className="footer">
      {/* <div className="row d-flex justify-content-end col-xm-4 col-7 col-md-9 col-lg-10"> */}
      <div className="nav px-3">
        <i className="far nav-icon fa-newspaper" onClick={handleMain}></i>
        <i className="fas nav-icon fa-snowboarding" onClick={handleProfile}></i>
        <i className="far nav-icon fa-bell" onClick={handleNotification}></i>

      </div></div>

  );
}

export default Footer;
