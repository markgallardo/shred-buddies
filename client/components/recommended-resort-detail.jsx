import React from 'react';

export default class RecommendedResortDetail extends React.Component {
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

    if (!this.state.resort) {
      return null;
    }
    return (
      <div className="row justify-content-center resort-detail">
        <div className="col-11 d-flex flex-wrap border">
          <h4>{this.state.resort.name}</h4>
          <p> { this.state.resort.address}</p>
          <p className="mt-n3">{this.state.resort.description}</p>
          <div className="ml-5">
            <img src={this.state.resort.imgUrl} alt="" className="img-detail"/>
          </div>
        </div>
        <button className="mt-2 btn-detail">Add to Event </button>
      </div>

    );

  }
}
