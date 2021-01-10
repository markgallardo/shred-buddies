import React from 'react';

function Header(props) {
  function handleMain() {
    props.setView('main', {});
  }

  return (
    <header className=" container-fluid d-flex justify-content-center align-items-center">
      <h2 className="head-title" onClick={handleMain}>Shred Buddies</h2>
      {/* <div className="row justify-content-end col-xm-4 col-7 col-md-9 col-lg-10">
        <i className="far header-icon fa-newspaper mr-3" onClick={handleMain}></i>
        <i className="fas header-icon fa-snowboarding mr-3" onClick={handleProfile}></i>
        <i className="far header-icon fa-bell mr-2" onClick={handleNotification}></i>

      </div> */}
    </header>
  );
}
export default Header;
