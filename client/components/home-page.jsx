import React from 'react';

export default function Homepage(props) {
  return (
    <div className="row d-flex align-items-center justify-content-center mt-5">
      <h1 className="head-title d-flex text-center ">SHRED  BUDDIES</h1>
      <div className="mt-5 border">
        <img src="\images\logo.png" alt=""/>
      </div>
      <div className="row justify-content-center mt-5">
        <button className="btn-detail ">LOG IN</button>
        <button className="btn-detail  mt-3" onClick={() => props.setView('create', {})}>CREATE ACCOUNT</button>
      </div>
    </div>

  );
}
