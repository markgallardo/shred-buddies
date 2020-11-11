import React from 'react';
//import CreateProfile from './create-profile';
import Header from './header';
import Profile from './profile';
import RecommendentResorDetail from './recommendent-resort-detail';


export default class App extends React.Component {

  render() {
    return (
      <>
        //<CreateProfile />
        <Header />
        <Profile/>
        <RecommendentResorDetail/>
      </>
    );
  }
}
