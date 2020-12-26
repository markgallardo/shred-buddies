import React from 'react';

export default class EventDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      events: null,
      participants: 0
    };
    this.handleClick = this.handleClick.bind(this);
  }

  // componentDidMount(object) {
  //   fetch(`/api/event/${this.props.params.eventsId}`)
  //     .then(res => res.json())
  //     .then(events => this.setState({
  //       events: events
  //     }))
  //     .catch(err => console.error(err));
  // }

  handleClick() {
    this.setState(prevState => ({
      participants: prevState.participants + 1
    }));
  }

  render() {
    const { events } = this.props.params;
    const start = new Date(events.start);
    const end = new Date(events.end);

    if (!this.props.params.events) {
      return (
        <div>NO ENTRY</div>
      );
    } else {
      return (
        <div className ="event-detail">
          <div className="container">
            <div className=" m-0 justify-content-center">
              <img src={events.resortImage} alt={events.resortName} className="imgEventDetails mt-3"/>
            </div>
            <div>
              <p><i className="fas fa-tram"></i>{events.resortName}</p>
              <p><i className="fas fa-calendar-day"></i> Start : {start.toDateString()}</p>
              <p><i className="fas fa-calendar-day"></i> End : {end.toDateString()}</p>
              <button onClick={this.handleClick} className="btn-eventdetail mb-1">request to join</button>
              <div className="eventdetaildesc mt-1">
                <p>{events.eventDescription}</p>
                <div><p>Shredders : {this.state.participants}</p></div>
              </div>
            </div>

          </div>
        </div>
      );
    }
  }
}
