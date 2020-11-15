import React from 'react';

export default class HostPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      event: null
    };

  }

  render() {
    const { resortId, description, startDate, endDate } = this.props.event;
    if (!this.props.event) {
      return null;
    }

    const start = new Date(startDate);
    const end = new Date(endDate);

    return (
      <div className="host">
        <div className="text-center mt-2">
          <button onClick={this.handleClick} className="btn-detail ml-1">delete</button>
        </div>
        <div className="mt-2 container">
          <img className="host-img" src="/images/big-bear.jpg"/>
          <div className="d-flex">
            <h2>{resortId}</h2>
            <div className="ml-5">
              <h4>{start.toDateString()}</h4>
              <h4>{end.toDateString()}</h4>
            </div>
          </div>
          <div>
            <h4>{description}</h4>
          </div>
        </div>
      </div>
    );
  }
}
