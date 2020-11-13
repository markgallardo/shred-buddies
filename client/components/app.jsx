import React from 'react';
import EventList from './event-list';
// import EventListItem from './event-list-item';
// import AddEvent from './add-event';
// import CreateProfile from './create-profile';
import Header from './header';
import Profile from './profile';
// import Profile from './profile';
// import RecommendentResorDetail from './recommendent-resort-detail';
// import ResortList from './resort-list';

import CreateProfile from './create-profile';
// import EventListItem from './event-list-item';
export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: 'create',
        params: {}
      },
      profile: null,
      user: null
    };

    this.createProfile = this.createProfile.bind(this);
    this.setView = this.setView.bind(this);

  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params: params
      }
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
        view: { name: 'profile', params: {} },
        profile: data.profileId,
        user: data

      }))
      .catch(err => console.error(err));
  }

  render() {
    let view = null;

    if (this.state.view.name === 'create') {
      view = <CreateProfile setView={this.setView} createProfile={this.createProfile} />;
    } else if (this.state.view.name === 'profile') {
      view =
      <>
        <Header setView={this.setView}/>
        <Profile setView={this.setView} params={this.state.view.params} profile={this.state.user}/>
      </>;
    } else if (this.state.view.name === 'main') {
      view =
      <>
        <Header setView={this.setView}/>
        <EventList setView={this.setView}/>
      </>;
    }
    return (
      <>

        {view}

        {/* <EventList /> */}
        {/* <EventListItem setView ={this.setView} />
         <CreateProfile setView ={this.setView} createProfile={this.createProfile} />
        <Profile/>
        <RecommendentResorDetail/>
        <ResortList/> */}

      </>
    );
  }
}
