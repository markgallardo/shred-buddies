import React from 'react';

export default class EventDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      events: ''
    };
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

  render() {
    const { events } = this.state;
    const start = new Date(events.start);

    // if (!this.state.events) {
    //   return null;

    return (
      <div className ="event-detail">
        <div className="container">
          <div className=" m-0 justify-content-center">
            <img src={events.resortImage} alt={events.resortName} className="imgEventDetails mt-3"/>
          </div>
          <div>
            <p><i className="fas fa-tram ml-3"></i>{events.resortName}</p>
            <p><i className="fas fa-calendar-day ml-3"></i>{start.toDateString()}</p>
            <button>request to join</button>
            <p>{events.eventDescription}</p>
          </div>

        </div>
      </div>
    );
  }
}
