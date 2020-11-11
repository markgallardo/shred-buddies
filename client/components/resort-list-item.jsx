import React from 'react';

export default function ResortListItem(props) {
  return (
    <div>
      <h1>Resort Lists</h1>
      <div className="row d-flex border ml-2">
        <img src="\images\mammoth-ski.jpg" alt="" className="img-list" />
        <div className="ml-1">
          <h5>Mammoth Mountain</h5>
          <p className="p-resortList ">10001 Minaret Rd, Mammoth Lakes, CA 93546</p>
        </div>
      </div>
    </div>
  );
}
