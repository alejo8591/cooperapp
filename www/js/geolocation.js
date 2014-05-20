$(document).on('pageinit', '#coops', function(event) {
  var getLocation, handleError, handleSuccess, initialize, showPoints;
  console.log('ready for coops');
  getLocation = function() {
    var decode;
    decode = decodeURIComponent(document.location.search);
    return navigator.geolocation.getCurrentPosition(handleSuccess, handleError);
  };
  handleSuccess = function(position) {
    var displayText, initialLatitude, initialLongitude;
    initialLatitude = position.coords.latitude;
    initialLongitude = position.coords.longitude;
    displayText = position.coords.latitude + "," + position.coords.longitude;
    return initialize(initialLatitude, initialLongitude);
  };
  handleError = function(error) {
    switch (error.code) {
      case error.PERMISSION_DENIED:
        return alert("User did not share geolocation data");
      case error.POSITION_UNAVAILABLE:
        return alert("Could not detect current position");
      case error.TIMEOUT:
        return alert("Retrieving position timed out");
      default:
        return alert("Unknown Error");
    }
  };
  initialize = function(latitude, longitude) {
    var array, directionsDisplay, geocoder, infoWindow, latlng, map, marker, properties;
    directionsDisplay = new google.maps.DirectionsRenderer();
    latlng = new google.maps.LatLng(latitude, longitude);
    properties = {
      center: latlng,
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map"), properties);
    array = [["Punto 1", "4.5980556", "-74.0758333"], ["Punto 2", "4.6080556", "-74.0758333"], ["Punto 3", "4.7180556", "-74.0758333"], ["Punto 4", "4.8280556", "-74.0758333"]];
    showPoints(map, array);
    marker = new google.maps.Marker({
      position: latlng,
      animation: google.maps.Animation.BOUNCE
    });
    geocoder = new google.maps.Geocoder();
    infoWindow = new google.maps.InfoWindow();
    return geocoder.geocode({
      latLng: latlng
    }, function(results, status) {
      var addressShort, cityReport, countryReport, splitAddress, splitCity;
      if (status === google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          directionsDisplay.setMap(map);
          marker.setMap(map);
          marker.setPosition(latlng);
          splitAddress = results[0].formatted_address.split(",", 2);
          addressShort = splitAddress[0].split("-", 2);
          splitCity = results[3].formatted_address.split(",", 2);
          document.getElementById("txt-coopAddress").value = addressShort[0];
          cityReport = splitCity[0];
          countryReport = results[5].formatted_address;
          infoWindow.setContent(document.getElementById("txt-coopAddress").value);
          return infoWindow.open(map, marker);
        } else {
          return alert("No results found");
        }
      } else {
        return alert("Error");
      }
    });
  };
  showPoints = function(map, sites) {
    var cant, i, marker;
    i = 0;
    while (i < sites.length) {
      cant = 0;
      infoPoints.push(new google.maps.InfoWindow());
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(sites[i][1], sites[i][2]),
        map: map,
        title: sites[i][0]
      });
      directionsDisplay.setMap(map);
      marker.setMap(map);
      marker.setPosition(marker.position);
      cant++;
      i++;
    }
    return google.maps.event.addListener(marker, "click", function() {
      var _results;
      i = 0;
      _results = [];
      while (i <= cant) {
        infoPoints[i].getContent();
        infoPoints[i].open(map, marker);
        _results.push(i++);
      }
      return _results;
    });
  };
  console.log('execute getLocation');
  return getLocation();
});
