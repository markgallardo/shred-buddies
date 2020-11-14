import React from 'react';
import EventList from './event-list';
// import EventListItem from './event-list-item';
// import AddEvent from './add-event';
import Header from './header';
import Profile from './profile';
// import Profile from './profile';
import ResortList from './resort-list';
import CreateProfile from './create-profile';

import Homepage from './home-page';

import RecommendedResortDetail from './recommended-resort-detail';
import AddEvent from './add-event';
import HostPage from './host-page';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {

        name: null,

        params: {}
      },
      profile: null,
      user: null,
      event: null,
      resort: null
    };
    this.setView = this.setView.bind(this);
    this.setUser = this.setUser.bind(this);
    this.createProfile = this.createProfile.bind(this);
    this.createEvent = this.createEvent.bind(this);
  }

  setUser(user) {
    this.setState({
      user: user
    });
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

  createEvent(object) {
    const requestOption = {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(object)
    };

    fetch('/api/event', requestOption)
      .then(result => result.json())
      .then(data => this.setState({
        view: { name: 'main', params: {} },
        event: data.eventId,
        profile: data.profileId,
        resort: data.resortId,
        user: data
      }))
      .catch(err => console.error(err));

  }

  render() {
    let view =
    <>
      <Header setView={this.setView} />
      <HostPage setView='host'/>
    </>;

    if (this.state.view.name === 'home') {
      view = <Homepage setView={this.setView}/>;
    } else if (this.state.view.name === 'create') {
      view = <CreateProfile setView={this.setView} createProfile={this.createProfile} />;
    } else if (this.state.view.name === 'profile') {
      view =
      <>
        <Header setView={this.setView}/>
        <Profile setView={this.setView} params={this.state.view.params} profile={this.state.user} setUser={this.setUser}/>
      </>;
    } else if (this.state.view.name === 'main') {
      view =
      <>
        <Header setView ={this.setView}/>
        <EventList setView={this.setView} event={this.state.user}/>;

      </>;
    } else if (this.state.view.name === 'resortList') {
      view =
      <>
        <Header setView={this.setView}/>
        <ResortList setView={this.setView} params={this.state.view.params}/>
      </>;

    } else if (this.state.view.name === 'resortDetails') {
      view =
      <>
        <Header setView={this.setView}/>
        <RecommendedResortDetail setView={this.setView} params={this.state.view.params}/>
      </>;
    } else if (this.state.view.name === 'addEvent') {
      view =
      <>
        <Header setView ={this.setView}/>
        <AddEvent setView={this.setView} createEvent={this.createEvent}/>
      </>;
    }
    return (
      <>

        {view}

      </>
    );
  }
}
