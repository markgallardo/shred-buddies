import React from 'react';

export default function ResortListItem(props) {

  function handleClick() {
    props.setView('resortDetails', { resortId: props.resorts.resortId });
  }
  return (

    <div className="container m-auto d-flex border ml-2 resort-list-item-card mt-4" onClick={handleClick}>
      <img src={props.resorts.imgUrl} alt="" className="img-list" />
      <div className="ml-1">
        <h5>{props.resorts.name}</h5>
        <p className="p-resortList">{props.resorts.address}</p>
      </div>
    </div>

  );

}
