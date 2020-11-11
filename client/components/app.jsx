import React from 'react';
import Header from './header';
import Profile from './profile';

export default class App extends React.Component {

  render() {
    return (
      <>
        <Header />
        <Profile/>
      </>
    );
  }
}
