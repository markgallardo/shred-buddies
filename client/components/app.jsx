
import React from 'react';
import EventList from './event-list';
import Header from './header';
import Profile from './profile';
import ResortList from './resort-list';
import CreateProfile from './create-profile';
import Homepage from './home-page';
import Notification from './notification-page';
import RecommendedResortDetail from './recommended-resort-detail';
import AddEvent from './add-event';
import EventDetails from './event-details';
import HostPage from './host-page';
import Footer from './footer';
import Login from './log-in';
// import ProfileTwo from './profile-two';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {

        name: 'home',

        params: {}
      },
      profile: null,
      user: null,
      event: null,
      resort: null,
      user2: null,
      events: null
    };
    this.setView = this.setView.bind(this);
    this.setUser = this.setUser.bind(this);
    this.createProfile = this.createProfile.bind(this);
    this.createEvent = this.createEvent.bind(this);
    this.addUser = this.addUser.bind(this);
  }

  addUser(userName) {
    this.setState({
      profile: userName
    });
  }

  setUser(user) {
    this.setState({
      user: user
    });
  }

  setUser2(user2) {
    this.setState({
      user2: user2
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
        view: { name: 'login', params: {} },
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
        view: { name: 'host', params: {} },
        event: data.eventId,
        profile: data.profileId,
        resort: data.resortId,
        user2: data
      }))
      .catch(err => console.error(err));

  }

  deleteEvent(object) {

    const eventId = object;
    fetch('/api/event/' + eventId, {
      method: 'DELETE'
    })

      .catch(err => console.error(err));
  }

  render() {

    let view = <>

      <Header setView={this.setView} />
      <AddEvent
        setView={this.setView}
        createEvent={this.createEvent}
        resort={this.state.resort}
        params={this.state.view.params} />
    </>;

    if (this.state.view.name === 'home') {
      view = <Homepage setView={this.setView} />;
    } else if (this.state.view.name === 'create') {
      view = <CreateProfile
        setView={this.setView}
        createProfile={this.createProfile} />;
    } else if (this.state.view.name === 'profile') {
      view =
        <>
          <Header setView={this.setView} />
          <Profile
            setView={this.setView}
            params={this.state.view.params}
            profile={this.state.user}
            addUser={this.addUser}
            setUser={this.setUser} />
          <Footer setView={this.setView} />
        </>;
    } else if (this.state.view.name === 'main') {
      view =
        <>
          <Header setView={this.setView} />
          <EventList setView={this.setView}
            event={this.state.user} />
          <Footer setView={this.setView} />

        </>;
    } else if (this.state.view.name === 'resortList') {
      view =
        <>
          <Header setView={this.setView} />
          <ResortList setView={this.setView}
            params={this.state.view.params} />
          <Footer setView={this.setView} />
        </>;

    } else if (this.state.view.name === 'resortDetails') {
      view =
        <>
          <Header setView={this.setView} />
          <RecommendedResortDetail
            setView={this.setView}
            params={this.state.view.params} />
          <Footer setView={this.setView} />
        </>;
    } else if (this.state.view.name === 'addEvent') {
      view =
        <>
          <Header setView={this.setView} />
          <AddEvent setView={this.setView}
            createEvent={this.createEvent}
            resort={this.state.resort}
            params={this.state.view.params} />
          <Footer setView={this.setView} />
        </>;
    } else if (this.state.view.name === 'notification') {
      view =
        <>
          <Header setView={this.setView} />
          <Notification setView={this.setView} />
          <Footer setView={this.setView} />
        </>;
    } else if (this.state.view.name === 'eventDetails') {
      view =
        <>
          <Header setView={this.setView} />
          <EventDetails
            setView={this.setView}
            params={this.state.view.params} />
          <Footer setView={this.setView} />
        </>;
    } else if (this.state.view.name === 'host') {
      view =
        <>
          <Header setView={this.setView} />
          <HostPage setView={this.setView}
            params={this.state.view.params}
            event={this.state.user2}
            deleteEvent={this.deleteEvent} />
          <Footer setView={this.setView} />
        </>;

    } else if (this.state.view.name === 'login') {
      view =
        <>
          <Login setView={this.setView}
            addUser={this.addUser}
            createProfile={this.createProfile}
            params={this.state.view.params} />
        </>;
    }

    return (
      <>
        {view}

      </>
    );
  }
}
