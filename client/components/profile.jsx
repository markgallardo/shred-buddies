import React from 'react';

class Profile extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      profile: null
    };
  }

  componentDidMount() {
    fetch(`/api/profile/${this.props.profile}`)
      .then(res => res.json())
      .then(profile =>
        this.setState({
          profile: profile
        }))
      .catch(err => console.error(err));
  }

  render() {
    if (!this.state.profile) {
      return null;
    }

    return (
      <div>
        <h2 className="ml-2 mt-2">Profile</h2>
        <div className="d-flex">
          <img className="profile-pic m-auto" src={this.state.profile.imgUrl} />
        </div>
        <div className="card-body">
          <h2 className="m-auto">{this.state.profile.name}</h2>
          <p className="email">{this.state.profile.email}</p>
          <p className="skill">{this.state.profile.skill}</p>
          <p className="description">{this.state.profile.description}</p>
        </div>
      </div>
    );
  }
}

export default Profile;
