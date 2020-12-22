import React from 'react';

class Profile extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      profile: null
    };
  }

  render() {

    const { name, email, skill, description, imgUrl } = this.props.profile;
    if (!this.props.profile) {
      return null;
    }

    return (

      <div className="profile-page container">
        <h2 className="ml-2 my-2 text-center">Profile</h2>
        <div className="d-flex mb-3 mt-n2">
          <img className="profile-pic m-auto" src={imgUrl} />
        </div>
        <h2 className="m-auto text-center">{name}</h2>
        <p className="email text-center">{email}</p>
        <div className="card-body profile-info">

          <h4 className="skill">level: {skill}</h4>
          <div>
            <h5 className="description">about: {description}</h5>
          </div>
        </div>
      </div>
    );
  }
}

export default Profile;
