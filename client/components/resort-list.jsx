import React from 'react';
import ResortListItem from './resort-list-item';

export default class ResortList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      resorts: []
    };
    this.getResorts = this.getResorts.bind(this);
    this.resortLists = this.resortLists.bind(this);
  }

  getResorts() {
    fetch('/api/resort')
      .then(res => res.json())
      .then(result => this.setState({ resorts: result }))
      .catch(err => console.error(err));
  }

  resortLists() {

    const list = this.state.resorts.map(resort => <ResortListItem key={resort.resortId} setView={this.props.setView} resorts={resort}/>);
    return (
      <>
        {list}
      </>
    );

  }

  componentDidMount() {
    this.getResorts();

  }

  render() {
    return (
      <div>
        <h4>Resort Lists</h4>
        {this.resortLists()}
      </div>
    );
  }
}
