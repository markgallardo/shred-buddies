import React from 'react';

export default class EventDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      events: '',
      participants: 0
    };
    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount(object) {
    fetch('/api/events')
      .then(res => res.json())
      .then(events =>
        this.setState({
          events: events
        }))
      .catch(err => console.error(err));
  }

  handleClick() {

    this.setState(prevState => ({
      participants: prevState.participants + 1
    }));
  }

  render() {
    const { events, participants } = this.state;
    const start = new Date(events.start);

    if (!this.state.events) {
      return null;
    }
    return (
      <div className ="event-detail">
        <div className="container">
          <div className=" m-0 justify-content-center">
            <img src={events.resortImage} alt={events.resortName} className="imgEventDetails mt-3"/>
          </div>
          <div>
            <p><i className="fas fa-tram"></i>{events.resortName}</p>
            <p><i className="fas fa-calendar-day"></i>{start.toDateString()}</p>
            <button onClick={this.handleClick} className="btn-eventdetail mb-1">request to join</button>
            <div className="eventdetaildesc mt-1">
              <p>{events.eventDescription}</p>
              <div><p>Shredders : {participants}</p></div>
            </div>
          </div>

        </div>
      </div>
    );
  }
}
