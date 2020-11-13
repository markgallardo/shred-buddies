import React from 'react';

export default class AddEvent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      resortId: 0,
      description: '',
      startDate: '',
      endDate: '',
      profileId: 0

    };
    this.handleChange = this.handleChange.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleChange(event) {
    const input = event.target.name;
    const value = event.target.value;
    const newState = {};
    newState[input] = value;
    this.setState(newState);

  }

  handleClick(event) {
    event.preventDefault();

    if (this.props.user) {

      this.props.setView('main', { eventId: this.props.event });
    }
  }

  render() {
    return (
      <div className="container add-event">
        <form>
          <div className="form-group">
            <label htmlFor="exampleFormControlInput1"><h3 className="mt-2">Add Event</h3></label>
            <input onChange={this.handleChange} value={this.state.resortId} name="resortId" type="text" className="form-control" id="exampleFormControlInput1" placeholder="location" />
          </div>
          <div className="d-flex">
            <div className="">
              <label>start date</label>
              <input onChange ={this.handleChange} value={this.state.startDate} name="startDate" type="date" className="form-control start-input" id="start-id" />
            </div>
            <div className="">
              <label>end date</label>
              <input onChange ={this.handleChange} value ={this.state.endDate} name="endDate" type="date" className="form-control end-input" id="end-id" />
            </div>
          </div>
          <div className="form-group mt-2">
            <label htmlFor="exampleFormControlSelect1">how many shreders</label>
            <select onChange ={this.handleChange} value={this.state.profileId} name= "profileId" className="form-control" id="exampleFormControlSelect1">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10</option>
            </select>
          </div>
          <div className="form-group">
            <label htmlFor="exampleFormControlTextarea1">event details</label>
            <textarea onChange={this.handleChange} value={this.state.description} name="description" className="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
          </div>
          <div className="text-center">
            <button onClick={this.handleClick} className="btn-detail m-auto">add event</button>
          </div>
        </form>
      </div>
    );
  }
}
