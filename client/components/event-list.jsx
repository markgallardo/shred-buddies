import React from 'react';
import EventListItem from './event-list-item';

export default class EventList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      events: []
    };
  }

  render() {
    // const events = this.state.events.map(event =>
    //   <EventListItem key={event.eventId} event={event} />
    // );
    return (
      <div>
        <ul className="nav">
          <li className="nav-item">
            <a className="nav-link active" href="#" onClick={() => this.props.setView('resortList', {})}>Add Event</a>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="#">Upcoming Event</a>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="#">Your Event</a>
          </li>

        </ul>
        <div>
          <EventListItem />
        </div>
      </div>
    );
  }
}
