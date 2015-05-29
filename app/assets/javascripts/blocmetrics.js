blocmetrics = {

  report: function(event){

    var _bm_event = {
      event_name: event
    };

    var _bm_request = new XMLHttpRequest();
    _bm_request.open("POST", "http://localhost:3000/api/events", true);
    _bm_request.setRequestHeader("Content-Type", "application/json");
    _bm_request.onreadystatechange = function(){};
    _bm_request.send(JSON.stringify(_bm_event));
  }

};