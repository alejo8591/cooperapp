(function() {
  var app;

  app = {
    initialize: function() {
      return this.bindEvents();
    },

    /*
    Bind any events that are required on startup. Common events are:
    'load', 'deviceready', 'offline', and 'online'.
     */
    bindEvents: function() {
      return document.addEventListener("deviceready", this.onDeviceReady, false);
    },

    /*
    The scope of `this` is the event. In order to
    call the `receivedEvent` function,
    we must explicity call `app.receivedEvent(...);`
     */
    onDeviceReady: function() {
      return app.receivedEvent("deviceready");
    },
    receivedEvent: function(id) {
      var listeningElement, parentElement, receivedElement;
      parentElement = document.getElementById(id);
      listeningElement = parentElement.querySelector(".listening");
      receivedElement = parentElement.querySelector(".received");
      listeningElement.setAttribute("style", "display:none;");
      receivedElement.setAttribute("style", "display:block;");
      return console.log("Received Event: " + id);
    }
  };

}).call(this);
