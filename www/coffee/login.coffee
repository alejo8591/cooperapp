jQuery.fn.reset = ->
  $(this).each ->
    @reset()
    
$(document).on "pageinit", "#home", ->
  console.log "Loading delegate event to home and login"
  if sessionStorage.length is 0
    
    # cargando login por no estar logeado
    console.log "sessionStorage clean"
    $.mobile.changePage "#login"
  else
    $.mobile.changePage "#home"
  $("#lookCookie").on "click", ->
    $("#setCookie").append "<p>" + sessionStorage.getItem("cookie") + "</p>"