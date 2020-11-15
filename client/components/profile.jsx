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
        <h2 className="ml-2 mt-2">Profile</h2>
        <div className="d-flex">
          <img className="profile-pic m-auto" src={imgUrl} />
        </div>
        <div className="card-body">
          <h2 className="m-auto">{name}</h2>
          <p className="email">{email}</p>
          <p className="skill">{skill}</p>
          <p className="description">{description}</p>
        </div>
      </div>
    );
  }
}

export default Profile;
