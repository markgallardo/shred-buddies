import React from 'react';
import Header from './header';
import Profile from './profile';
import RecommendentResorDetail from './recommendent-resort-detail';
import ResortListItem from './resort-list-item';

export default class App extends React.Component {

  render() {
    return (
      <>
        <Header />
        <Profile/>
        <RecommendentResorDetail/>
        <ResortListItem/>
      </>
    );
  }
}
