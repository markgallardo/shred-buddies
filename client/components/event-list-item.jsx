import React from 'react';

function EventListItem(props) {
  return (

    <div className="col-9 m-auto">
      <div className="card bg-dark text-white">
        <img className="card-img event-img" src="images/big-bear.jpg" alt="Card image"/>
        <div className="card-img-overlay">
          <h5 className="card-title">Card title</h5>
          <p className="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
  );
}
export default EventListItem;
