import React from 'react';

function Profile(props) {

  return (
    <div>
      <h2 className="ml-2 mt-2">Profile</h2>
      <div className="d-flex">
        <img className="profile-pic m-auto" src="./images/chewbacca.png"/>
      </div>
      <div className="card-body">
        <h2 className="m-auto">Chewy Bacca</h2>
        <p className="email">chewy123@starwars.com</p>
        <p className="skill">Skill Level: expert</p>
        <p className="description">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ea minima recusandae, cupiditate, tenetur asperiores perspiciatis ullam eligendi dolores quo </p>
      </div>
    </div>
  );
}

export default Profile;
