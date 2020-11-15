import React from 'react';

export default class HostPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      resort: null
    };
  }

  componentDidMount() {
    fetch(`/api/resort/${this.props.params.resortId}`)
      .then(res => res.json())
      .then(resort =>
        this.setState({
          resort: resort
        }))
      .catch(err => console.error(err));
  }

  render() {

    return (
      <div className="host">
        <div className="text-center container d-flex mt-2">
          <button onClick={this.handleClick} className="btn-detail">edit</button>
          <button onClick={this.handleClick} className="btn-detail ml-1">delete</button>
        </div>
        <div className="mt-2 container">
          <img className="host-img" src="/images/big-bear.jpg"/>
          <div className="d-flex">
            <h2>{this.state.resort.name}</h2>
            <div className="ml-5">
              <h4>Date</h4>
            </div>
          </div>
          <div>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam soluta sit reprehenderit officiis rerum ducimus facere ab voluptate laudantium necessitatibus ex quibusdam exercitationem magnam, molestiae, doloribus quo nam aperiam cupiditate?
          </div>
        </div>
      </div>
    );
  }
}
