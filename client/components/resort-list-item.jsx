import React from 'react';

export default function ResortListItem(props) {
  return (

    <div className="row d-flex border ml-2">
      <img src={props.resorts.imgUrl} alt="" className="img-list" />
      <div className="ml-1">
        <h5>{props.resorts.name}</h5>
        <p className="p-resortList ">{props.resorts.address}</p>
      </div>
    </div>

  );
}
