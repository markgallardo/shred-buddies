import React from 'react';

export default class AddEvent extends React.Component {
  render() {
    return (
      <div className="container add-event">
        <form>
          <div className="form-group">
            <label htmlFor="exampleFormControlInput1"><h3 className="mt-2">Add Event</h3></label>
            <input type="text" className="form-control" id="exampleFormControlInput1" placeholder="location" />
          </div>
          <div className="d-flex">
            <div className="">
              <label>start date</label>
              <input type="date" className="form-control start-input" id="start-id" />
            </div>
            <div className="">
              <label>end date</label>
              <input type="date" className="form-control end-input" id="end-id" />
            </div>
          </div>
          <div className="form-group mt-2">
            <label htmlFor="exampleFormControlSelect1">how many shreders</label>
            <select className="form-control" id="exampleFormControlSelect1">
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
            <textarea className="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
          </div>
          <div className="text-center">
            <button onClick={this.handleClick} className="btn-detail m-auto">add event</button>
          </div>
        </form>
      </div>
    );
  }
}
