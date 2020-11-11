import React from 'react';

export default class CreateProfile extends React.Component {

  render() {
    return (
      <div className="create-form">
        <header className="create-header d-flex justify-content-center align-items-center">SB</header>
        <form className="container col-11">
          <div className="form-group">
            <label htmlFor="formGroupExampleInput"><h3>Create Profile</h3></label>
            <input type="text" className="form-control mb-4" id="formGroupExampleInput" placeholder="name"/>
            <input type="email" className="form-control mb-4 create-email" id="email-id" placeholder ="email"/>
            <select className ="form-control mb-4">
              <option>skill level</option>
              <option>beginner</option>
              <option>intermediate</option>
              <option>expert</option>
            </select>
            <textarea className="form-control mb-4" placeholder="description of yourself" rows="7"></textarea>
            <input className="form-control file-path validate mb-4" type="text" placeholder="upload profile picture"/>
            <div className="text-center">
              <button className="btn-detail">create profile</button>
            </div>
          </div>
        </form>
      </div>
    );
  }
}
