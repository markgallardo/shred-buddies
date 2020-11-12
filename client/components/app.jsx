import React from 'react';
// import CreateProfile from './create-profile';
import Header from './header';
import Profile from './profile';
import RecommendedResortDetail from './recommended-resort-detail';
import ResortList from './resort-list';

export default class App extends React.Component {

  render() {
    return (
      <>
        {/* <CreateProfile /> */}
        <Header />
        <Profile/>
        <RecommendedResortDetail/>
        <ResortList/>
      </>
    );
  }
}
