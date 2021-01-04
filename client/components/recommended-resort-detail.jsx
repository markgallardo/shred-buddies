import React from 'react';

export default class RecommendedResortDetail extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      resort: null
    };

    this.handleClick = this.handleClick.bind(this);
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

  handleClick(event) {

    this.props.setView('addEvent', { resortId: this.state.resort.resortId });

  }

  render() {

    if (!this.state.resort) {
      return null;
    }
    return (

      <div className="justify-content-center resort-detail">
        <div className="d-flex flex-wrap">
          <div className="mb-3 mx-2">
            <h4><i className="fas fa-chevron-left pt-3"
              onClick={() => this.props.setView('resortList', {})}></i> {this.state.resort.name}</h4>
          </div>
          <p className="mt-n4 mx-2 mb-3"> { this.state.resort.address}</p>
          <p className="mt-n3 mx-2 py-2">{this.state.resort.description}</p>
          <div className="ml-5 m-auto py-4">
            <img src={this.state.resort.imgUrl} alt="" className="img-detail mt-n3"/>
          </div>
        </div>
        <div className="text-center">
          <button className="mt-2 btn-detail" onClick={this.handleClick}>Add to Event </button>
        </div>
      </div>

    );

  }
}
