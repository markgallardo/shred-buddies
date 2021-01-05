import React from 'react';

class Profile extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      profile: null
    };
  }

  render() {
    // console.log(this.props.params.profileId);
    const { name, email, skill, description, imgUrl } = this.props.params.profileId;
    if (!this.props.params.profileId) {
      return null;
    }
    return (
      <div className="profile-page">
        <h2 className="ml-2 my-3 text-center">Profile</h2>
        <div className="mx-2 profile-info row d-flex align-items-end">
          <div className="col content-container mb-3 mt-5 position-relative">
            <div className="pic-box row mx-auto justify-content-center position-relative mb-2">
              <img className="profile-pic m-auto"
                src={imgUrl} alt={name} />
            </div>
            <div className="name-box row justify-content-start flex-column position-relative">
              <h2 className="m-auto text-center">{name}</h2>
              <p className="email text-center">{email}</p>
            </div>
            <div className="extra-box pt-3 col-11 m-auto position-relative">
              <h5 className="">Skill Level : {skill}</h5>
              <div>
                <h5 className="pt-2">About</h5>
                <h5 className="description">{description}</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
// const { name, email, skill, description, imgUrl } = this.props.profile;
// if (!this.props.profile) {
//   return null;
// }
// return (
//   <div className="profile-page">
//     <h2 className="ml-2 my-3 text-center">Profile</h2>
//     <div className="mx-2 profile-info row d-flex align-items-end">
//       <div className="col content-container mb-3 mt-5 position-relative">
//         <div className="pic-box row mx-auto justify-content-center position-relative mb-2">
//           <img className="profile-pic m-auto"
//             src={imgUrl} alt={name} />
//         </div>
//         <div className="name-box row justify-content-start flex-column position-relative">
//           <h2 className="m-auto text-center">{name}</h2>
//           <p className="email text-center">{email}</p>
//         </div>
//         <div className="extra-box pt-3 col-11 m-auto position-relative">
//           <h5 className="">Skill Level : {skill}</h5>
//           <div>
//             <h5 className="pt-2">About</h5>
//             <h5 className="description">{description}</h5>
//           </div>
//         </div>
//       </div>
//     </div>
//   </div>
// );

export default Profile;
