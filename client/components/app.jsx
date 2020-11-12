
import React from 'react';
import EventList from './event-list';
// import EventListItem from './event-list-item';
// import CreateProfile from './create-profile';
import Header from './header';
// import Profile from './profile';
// import RecommendentResorDetail from './recommendent-resort-detail';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: 'create',
        params: {}
      }
    };
    this.createProfile = this.createProfile.bind(this);

  }

  setView(name, params) {
    this.setState({
      // view: {
      //   name: name,
      //   params: params
      // }
    });
  }

  createProfile(object) {
    const requestOption = {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(object)

    };
    fetch('/api/profile', requestOption)
      .then(result => result.json())
      .then(data => this.setState({
        view: { name: 'profile', params: {} }

      }))
      .catch(err => console.error(err));

  }

  render() {
    // let view = null;

    // if (this.state.view.name === 'create') {
    //   view = <CreateProfile setView={this.setView} createProfile={this.createProfile} />;
    // }
    return (
      <>
        <Header />
        <EventList />
        {/* <EventListItem setView ={this.setView} /> */}
        {/* <CreateProfile setView ={this.setView} createProfile={this.createProfile} /> */}
        {/* <Header />
        <Profile/>
        <RecommendentResorDetail/> */}
      </>
    );
  }
}
