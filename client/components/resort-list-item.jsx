import React from 'react';

export default function ResortListItem(props) {

  function handleClick() {
    props.setView('resortDetails', { resortId: props.resorts.resortId });
  }
  return (

    <div className="container d-flex border resort-list-item-card my-2 py-3 col-10" onClick={handleClick}>
      <img src={props.resorts.imgUrl} alt="" className="img-list" />
      <div className="ml-1">
        <h5>{props.resorts.name}</h5>
        <p className="p-resortList">{props.resorts.address}</p>
      </div>
    </div>

  );

}
