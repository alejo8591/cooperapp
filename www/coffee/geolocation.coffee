# ### Geolocation for Maps
$(document).on 'pageinit', '#coops', (event)->

  console.log 'ready for coops'
  # ##### DirectionService lets calculate directions with GoogleMaps
  getLocation = ->
  
    # clearData();
    decode = decodeURIComponent(document.location.search)
    navigator.geolocation.getCurrentPosition handleSuccess, handleError
    
  handleSuccess = (position) ->
    initialLatitude = position.coords.latitude
    initialLongitude = position.coords.longitude
    displayText = position.coords.latitude + "," + position.coords.longitude
    initialize initialLatitude, initialLongitude
  
  handleError = (error) ->
    switch error.code
      when error.PERMISSION_DENIED
        alert "User did not share geolocation data"
      when error.POSITION_UNAVAILABLE
        alert "Could not detect current position"
      when error.TIMEOUT
        alert "Retrieving position timed out"
      else
        alert "Unknown Error"
  
  initialize = (latitude, longitude) ->
  
    # DirectionsRenderer object to render DirectionService results.
    directionsDisplay = new google.maps.DirectionsRenderer()
  
    # Locate latitude and longitude actual coords in map
    latlng = new google.maps.LatLng(latitude, longitude)
    properties =
      center:latlng
      zoom:10
      mapTypeId:google.maps.MapTypeId.ROADMAP

  
    # Locate map div in HTML page and set map with the properties stablished
    # map = new google.maps.Map(document.getElementById("map"), properties);
    # directionsDisplay.setMap(map);
  
    # Create markup into the actual position
    map = new google.maps.Map(document.getElementById("map"), properties)
    array = [
      [
        "Punto 1"
        "4.5980556"
        "-74.0758333"
      ]
      [
        "Punto 2"
        "4.6080556"
        "-74.0758333"
      ]
      [
        "Punto 3"
        "4.7180556"
        "-74.0758333"
      ]
      [
        "Punto 4"
        "4.8280556"
        "-74.0758333"
      ]
    ]
    showPoints map, array
    marker = new google.maps.Marker(
      position:latlng
      animation:google.maps.Animation.BOUNCE
    )
  
    # Geocoder inverse lets get address with latitude and longitute coords
    geocoder = new google.maps.Geocoder()
    infoWindow = new google.maps.InfoWindow()
    geocoder.geocode
      latLng:latlng
    , (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        if results[0]
          directionsDisplay.setMap map
          marker.setMap map
          marker.setPosition latlng
        
          # First split for descart Country,city
          splitAddress = (results[0].formatted_address).split(",", 2)
        
          # Second split for discard number '-'
          addressShort = splitAddress[0].split("-", 2)
          splitCity = (results[3].formatted_address).split(",", 2)
          document.getElementById("txt-coopAddress").value = addressShort[0]
        
          # document.getElementById("ICity").value = splitCity[0];
          cityReport = splitCity[0]
        
          # document.getElementById("ICountry").value = results[5].formatted_address;
          countryReport = results[5].formatted_address
        
          # $('#address').text(results[0].formatted_address);
          # Is showed a dialog with the address in the map
          infoWindow.setContent document.getElementById("txt-coopAddress").value
          infoWindow.open map, marker
        else
          alert "No results found"
      else
        alert "Error"

  showPoints = (map, sites) ->
    i = 0

    while i < sites.length
      cant = 0
      infoPoints.push new google.maps.InfoWindow()
      marker = new google.maps.Marker(
        position:new google.maps.LatLng(sites[i][1], sites[i][2])
        map:map
        title:sites[i][0]
      )
      directionsDisplay.setMap map
      marker.setMap map
      marker.setPosition marker.position
      cant++
      i++
    google.maps.event.addListener marker, "click", ->
      i = 0

      while i <= cant
        infoPoints[i].getContent()
        infoPoints[i].open map, marker
        i++

  console.log 'execute getLocation'
  getLocation()