import React from 'react';
// import EventList from './event-list';
// import EventListItem from './event-list-item';
// import AddEvent from './add-event';
// import CreateProfile from './create-profile';
import Header from './header';
import Profile from './profile';
// import Profile from './profile';
import ResortList from './resort-list';
import CreateProfile from './create-profile';
import EventList from './event-list';
import RecommendedResortDetail from './recommended-resort-detail';
export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: 'main',
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
        <Header/>
        <Profile setView={this.setView} params={this.state.view.params} profile={this.state.user}/>
      </>;
    } else if (this.state.view.name === 'main') {
      view =
      <>
        <Header/>
        <EventList setView={this.setView}/>;
      </>;
    } else if (this.state.view.name === 'resortList') {
      view =
      <>
        <Header/>
        <ResortList setView={this.setView} params={this.state.view.params}/>
      </>;

    } else if (this.state.view.name === 'resortDetails') {
      view =
      <>
        <Header/>
        <RecommendedResortDetail setView={this.setView} params={this.state.view.params}/>
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
