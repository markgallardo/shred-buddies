import React from 'react';

class Login extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      users: []
    };
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount() {
    this.getUsers();
  }

  getUsers() {
    fetch('/api/profile')
      .then(res => res.json())
      .then(data => this.setState({
        users: data
      }))
      .catch(err => console.error(err));

  }

  handleChange(event) {
    const index = event.target.selectedIndex;
    const selected = event.target.childNodes[index];
    const id = selected.getAttribute('userId');
    this.props.addUser({
      user: event.target.value,
      userId: parseInt(id)
    });

    // this.props.setView('profile', { profileId: this.state.users });
    this.props.setView('profile', {});

    // console.log(this.state.users);

  }

  render() {

    return (
      <div className="login col">
        <h2 className="head-title d-flex justify-content-center mt-5 pt-5">Shred Buddies</h2>
        <div className="d-flex justify-content-center align-items-center pt-4">
          <select className="form-control-lg col-11 mt-3" onChange={this.handleChange} id={this.state.users} >
            <option className="col-9">Select User</option>
            <option value="145" userId="1">Mark Gallardo</option>
            <option value="144" userId="2">Jason Gonzales</option>

          </select>
        </div>
      </div>
    );
  }
}

export default Login;
