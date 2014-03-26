/** This is a OnDeviceRady for Apache Cordova (PhoneGap) */
var app = {
    /** App Represents the constructor for CooperApp with PhoneGap 
     * @constructor 
     */
    initialize: function() {
        this.bindEvents();
    },
    /** Bind Event Listeners 
     *
     * Bind any events that are required on startup. Common events are:
     * 'load', 'deviceready', 'offline', and 'online'.
     * @constructor
     */
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicity call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        app.receivedEvent('deviceready');
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    }
};
