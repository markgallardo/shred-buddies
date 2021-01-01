import React from 'react';

class Profile extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      profile: null
    };
  }

  render() {
    return (
      <div className="profile-page">
        <h2 className="ml-2 my-2 text-center">Profile</h2>
        <div className="profile-info">
          <div className="pic-box d-flex mb-3 mt-n2 position-relative">
            <img className="profile-pic m-auto" src="https://ca.slack-edge.com/T1EHQUJ8J-U01553CD1HS-92382557d5b7-512" alt="profile-pic" />
          </div>
          <div className="profile-name position-relative">
            <h2 className="m-auto text-center">Jason Gonzales</h2>
            <p className="email text-center">jasongonzo25@gmail.com</p>
          </div>
          <div className="card-body col-11 m-auto position-relative">

            <h4 className="skill">level: expert</h4>
            <div>
              <h5 className="description">about:I like to eat and snowboard on the weekends.</h5>
            </div>
          </div>
        </div>

      </div>
    );
  }
}

export default Profile;

// render() {

//   const { name, email, skill, description, imgUrl } = this.props.profile;
//   if (!this.props.profile) {
//     return null;
//   }

//   return (

//     <div className="profile-page">
//       <h2 className="ml-2 my-2 text-center">Profile</h2>
//       <div className=" d-flex mb-3 mt-n2">
//         <img className="profile-pic m-auto" src={imgUrl} />
//       </div>
//       <h2 className="m-auto text-center">{name}</h2>
//       <p className="email text-center">{email}</p>
//       <div className="card-body profile-info col-11 m-auto">

//         <h4 className="skill">level: {skill}</h4>
//         <div>
//           <h5 className="description">about: {description}</h5>
//         </div>
//       </div>
//     </div>
//   );
// }
