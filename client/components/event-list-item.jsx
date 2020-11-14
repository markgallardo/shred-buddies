import React from 'react';

export default class EventList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      events: []
    };
  }

  componentDidMount(object) {
    const requestOption = {
      method: 'GET',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(object)
    };

    fetch('/api/events', requestOption)
      .then(result => result.json())
      .then(data => this.setState({
        events: data
      }))

      .catch(err => console.error(err));
  }

  render() {
    const { events } = this.state;

    const start = new Date(events.start);
    const end = new Date(events.end);

    return (

      <div className="col-9 m-auto">
        <div className="card bg-dark text-white">
          <img className="card-img event-img" src="images/big-bear.jpg" alt="Card image" />
          <div className="card-img-overlay">
            <h5 className="card-title">{events.resortName}</h5>
            <p className="mt-n2">starts: {start.toDateString()}</p>
            <p className="mt-n4">ends: {end.toDateString()}</p>
            <p className="card-text mt-n2">{events.eventDescription}</p>
          </div>
        </div>
      </div>
    );
  }
}
