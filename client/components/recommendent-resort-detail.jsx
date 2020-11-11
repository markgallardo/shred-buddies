import React from 'react';

export default function RecommendentResorDetail(props) {

  return (
    <div className="row justify-content-center">
      <div className="col-11 d-flex flex-wrap border">
        <h4>Mammoth Mountain</h4>
        <p> 10001 Minaret Rd, Mammoth Lakes, CA 93546</p>
        <p>Mammoth Mountain Ski Area is a large ski resort in the western United States, located in eastern California along the east side of the Sierra Nevada mountain range in the Inyo National Forest. Mammoth has more than 3,500 acres of ski-able terrain, serviced by 28 lifts</p>
        <div className="ml-5">
          <img src="\images\mammoth-ski.jpg" alt="" className="img-detail"/>
        </div>
      </div>
      <button className="mt-2 btn-detail">Add to Event </button>
    </div>

  );
}
