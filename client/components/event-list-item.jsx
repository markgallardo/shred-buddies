import React from 'react';

export default function EventListItem(props) {

  function handleClick() {

    props.setView('eventDetails', { events: props.events });

  }

  const start = new Date(props.events.start);
  const end = new Date(props.events.end);

  if (props.events) {
    return (

      <div className="col-11 m-auto" onClick={handleClick}>
        <div className="card bg-dark text-white my-3">
          <img className="event-img" src={props.events.resortImage} alt="Card image" />
          <div className="card-img-overlay">
            <h5 className="card-title">{props.events.resortName}</h5>
            <p className="mt-n2">starts: {start.toDateString()}</p>
            <p className="mt-n4">ends: {end.toDateString()}</p>
            <p className="card-text my-2">{props.events.eventDescription}</p>

          </div>
        </div>
      </div>
    );
  }

}

// export default class EventList extends React.Component {
//   constructor(props) {
//     super(props);
//     this.state = {
//       events: []
//     };
//     this.handleClick = this.handleClick.bind(this);
//   }

//   componentDidMount(object) {
//     const requestOption = {
//       method: 'GET',
//       headers: { 'Content-Type': 'application/json' },
//       body: JSON.stringify(object)
//     };

//     fetch('/api/events', requestOption)
//       .then(result => result.json())
//       .then(data => this.setState({
//         events: data
//       }))
//       .catch(err => console.error(err));
//   }

//   handleClick() {
//     if (this.state.events) {
//       this.props.setView('eventDetails', { eventsId: this.state.events });
//     }
//   }

//   render() {
//     const { events } = this.state;
//     if (events) {
//       console.log(events)
//     }
//     const start = new Date(events.start);
//     const end = new Date(events.end);

//     return (

//       <div className="col-9 m-auto event-card" onClick={this.handleClick}>
//         <div className="card bg-dark text-white">
//           <img className="event-img" src={events.resortImage} alt="Card image" />
//           <div className="">
//             <h5 className="card-title">{events.resortName}</h5>
//             <p className="mt-n2">starts: {start.toDateString()}</p>
//             <p className="mt-n4">ends: {end.toDateString()}</p>
//             <p className="card-text mt-n2">{events.eventDescription}</p>
//             <p className="card-text mt-n2">description : {events.resortName}</p>

//           </div>
//         </div>
//       </div>
//     );
//   }
// }
