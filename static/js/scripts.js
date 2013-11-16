var directionsDisplay;
//DirectionService lets calculate directions with GoogleMaps
var directionsService = new google.maps.DirectionsService();
var map;
var initialLatitude = 0.0;
var initialLongitude = 0.0;
var finalLatitude = 0.0;
var finalLongitude = 0.0;
var latLng = null;

var marker;
var infowindow;
var geocoder;
var currentdate = new Date();
// var datetime;

var year = currentdate.getFullYear().toString();
var month = (currentdate.getMonth()+1) < 10 ? "0"+(currentdate.getMonth()+1) : (currentdate.getMonth()+1);
var day = currentdate.getDate() < 10 ? "0"+currentdate.getDate() : currentdate.getDate();
var hours = currentdate.getHours() < 10 ? "0"+currentdate.getHours() : currentdate.getHours();
var minutes = currentdate.getMinutes() < 10 ? "0"+currentdate.getMinutes() : currentdate.getMinutes();
var seconds = currentdate.getSeconds() < 10 ? "0"+currentdate.getSeconds() : currentdate.getSeconds();
var miliseconds = currentdate.getMilliseconds() < 10 ? "0"+currentdate.getMilliseconds() : currentdate.getMilliseconds();

var fullDateTime = year.toString()+month.toString()+day.toString()+"_"+hours.toString()+minutes.toString()+seconds.toString()+miliseconds.toString(); 

var cityReport = "";
var countryReport = ""; 
// var fullDateTime = "20130822_040115";


function getLocation() {
  // clearData();
  var decode = decodeURIComponent(document.location.search);
  // if(!decode.substring(1))  
      navigator.geolocation.getCurrentPosition(handleSuccess, handleError);
  // getActualDate();
}

function handleSuccess(position) {
  initialLatitude = position.coords.latitude;
  initialLongitude = position.coords.longitude; 
  var displayText = position.coords.latitude+","+position.coords.longitude;

  //display the string with initial car latitudeand longitude
  // document.getElementById("vehiclePosition").innerHTML = displayText;
  initialize(initialLatitude, initialLongitude);
}

function handleError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            alert("User did not share geolocation data");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("Could not detect current position");
            break;
        case error.TIMEOUT:
            alert("Retrieving position timed out");
            break;
        default:
            alert("Unknown Error");
            break;
    }
}

function initialize(latitude, longitude) {
  //DirectionsRenderer object to render DirectionService results.
  directionsDisplay = new google.maps.DirectionsRenderer();
  
  //Locate latitude and longitude actual coords in map
  latlng = new google.maps.LatLng(latitude, longitude);

  var properties = {
    center:latlng,
    zoom:16,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };

  //Locate map div in HTML page and set map with the properties stablished
  //map = new google.maps.Map(document.getElementById("map"), properties);
  //directionsDisplay.setMap(map);

  //Create markup into the actual position
  var map = new google.maps.Map(document.getElementById("map"), properties);

  // var array = [
  // ['Punto 1', '4.5980556,-74.0758333'],
  // ['Punto 2', '4.6080556,-74.0758333'],
  // ['Punto 3', '4.6180556,-74.0758333'],
  // ['Punto 4', '4.6280556,-74.0758333'],
  // ];

  // showPoints(map, array);

  // marker = new google.maps.Marker({
  // position:latlng,
  // animation:google.maps.Animation.BOUNCE
  // });

  // //Geocoder inverse lets get address with latitude and longitute coords
  // geocoder = new google.maps.Geocoder();
  // infoWindow = new google.maps.InfoWindow();

  // geocoder.geocode({'latLng': latlng}, function(results, status){
  // if(status == google.maps.GeocoderStatus.OK){
  //   if(results[0])
  //     {
  //       directionsDisplay.setMap(map);
  //         marker.setMap(map);
  //         marker.setPosition(latlng);

  //       //First split for descart Country,city
  //       var splitAddress = (results[0].formatted_address).split(',',2);
  //       //Second split for discard number '-' 
  //       var addressShort = splitAddress[0].split('-',2);
  //       var splitCity = (results[3].formatted_address).split(',',2);
                  
  //       document.getElementById("IAddress").value = addressShort[0];
  //       // document.getElementById("ICity").value = splitCity[0];
  //       cityReport = splitCity[0];
  //       // document.getElementById("ICountry").value = results[5].formatted_address;
  //       countryReport = results[5].formatted_address;

  //       //$('#address').text(results[0].formatted_address);
  //       //Is showed a dialog with the address in the map
  //       infoWindow.setContent(document.getElementById("IAddress").value);
  //       infoWindow.open(map, marker);
        
  //       google.maps.event.addListener(marker, 'click', function(){
  //           infoWindow.setContent(document.getElementById("IAddress").value);
  //           infoWindow.open(map, marker);
  //       });
  //     }
  //     else {
  //       alert('No results found');
  //     }
  //   }
  //   else
  //   {
  //     alert("Error");
  //   }
  // });
}

function showPoints(map, sites){
    // var lat1 = new google.maps.LatLng(14.5980556,-74.0758333);
    // var point1 = new google.maps.Marker({
    //   position: lat1,
    //   map:map,
    //   title: "Hola mundo"
    // });

    // directionsDisplay.setMap(map);
    //          point1.setMap(map);
    //          point1.setPosition(lat1);

    // google.maps.event.addListener(point1, 'click', function(){
    //           infoWindow.setContent("ssssss");
    //           infoWindow.open(map, point1);
    // });

    // for (var i = 0; i < sites.length; i++) {
    //     var marker = new google.maps.Marker({
    //         position: hotels[i][1],hotels[i][2],
    //         map: map,
    //         title: hotels[i][0],
    //     });
    // }
}

function calculateCredit(){
  var amount = document.getElementById("txt-amount").value;
  var interestRate = document.getElementById("txt-interestRate").value;
  var feeNumber = document.getElementById("txt-feeNumber").value;
  
  var feeToPay = amount*(interestRate/100);
  var totalPay = feeToPay*feeNumber+parseInt(amount);
  var totalInterest = amount/totalPay;
  totalInterest = totalInterest.toFixed(2);

  document.getElementById("txt-feeToPay").value = feeToPay;
  document.getElementById("txt-totalPay").value = totalPay;
  document.getElementById("txt-totalInterest").value = totalInterest;
}

Lungo.Events.init({
   'tap section#splash article div button#enter': function(){
    getLocation();
  },
});