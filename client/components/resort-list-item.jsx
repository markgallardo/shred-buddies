import React from 'react';

export default function ResortListItem(props) {

  function handleClick() {
    props.setView('resortDetails', { resortId: props.resorts.resortId });
  }
  return (

  // <div className="container d-flex border resort-list-item-card my-2 py-3 col-11 col-lg-9" onClick={handleClick}>
  //   <img src={props.resorts.imgUrl} alt="" className="img-list" />
  //   <div className="ml-1">
  //     <h5>{props.resorts.name}</h5>
  //     <p className="p-resortList">{props.resorts.address}</p>
  //   </div>
  // </div>

    <div className="card resort-card mb-3 mx-xl-2 mb-xl-5"
      onClick={handleClick} >
      <img className="card-img-top resort-list-img rounded-top" src={props.resorts.imgUrl} alt="Card image cap" />
      <div className="card-body py-2">
        <h5 className="card-title"> {props.resorts.name}</h5>
        <p className="card-text">{props.resorts.address}</p>
      </div>
    </div>

  );

}
