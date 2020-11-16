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

      <div className="profile-page">
        <h2 className="ml-2 my-2">Profile</h2>
        <div className="d-flex mb-3 mt-n2">
          <img className="profile-pic m-auto" src={imgUrl} />
        </div>
        <div className="card-body profile-info">
          <h2 className="m-auto">{name}</h2>
          <p className="email">{email}</p>
          <h4 className="skill">level: {skill}</h4>
          <div>
            <h5 className="description">{description}</h5>
          </div>
        </div>
      </div>
    );
  }
}

export default Profile;
