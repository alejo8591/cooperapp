$(document).on "pageinit", "#editProfile", (event) ->
  console.log "Building DOM editing profile"
  $("input#userEmail").val(localStorage.getItem("email")).attr "disabled", "disabled"
  $("input#firstname").val localStorage.getItem("firstname")
  $("input#lastname").val localStorage.getItem("lastname")
  $("input#phone").val localStorage.getItem("phone")
  
  $("#updateProfile").on "click", ->
    if $("input#firstname").val() isnt "" and $("input#lastname").val() isnt "" and $("input#phone").val() isnt ""
      update_data = {}
      update_data.email = localStorage.getItem("email")
      if localStorage.getItem("firstname") isnt $("input#firstname").val()
        update_data.firstname = $("input#firstname").val()
      else
        update_data.firstname = localStorage.getItem("firstname")
      if localStorage.getItem("lastname") isnt $("input#lastname").val()
        update_data.lastname = $("input#lastname").val()
      else
        update_data.lastname = localStorage.getItem("lastname")
      if localStorage.getItem("phone") isnt $("input#phone").val()
        update_data.phone = $("input#phone").val()
      else
        update_data.phone = localStorage.getItem("phone")
      console.log update_data

      sessionStorage.setItem "cookie", update_data.cookie
      localStorage.setItem "email", update_data.email
      localStorage.setItem "firstname", update_data.firstname
      localStorage.setItem "lastname", update_data.lastname
      localStorage.setItem "phone", update_data.phone
      $.mobile.changePage '#profile'
    else
      alert 'Hay campos en blanco'
    
    #
    #			type (default: 'GET')
    #			Type: String
    #			The type of request to make ("POST" or "GET"), default is "GET". Note: Other HTTP request methods,
    #			such as PUT and DELETE, can also be used here, but they are not supported by all browsers.
    #
    ###
    ```	javascript
    $.ajax(
      type: "POST"
      url: "http://127.0.0.1:3000/api/v1/user/update"
      dataType: "json"
      data: update_data
    ).done((data) ->
      console.log "Ajax correcto"
      if data.error is `undefined`
        sessionStorage.setItem "cookie", data.cookie
        localStorage.setItem "email", data.email
        localStorage.setItem "firstname", data.firstname
        localStorage.setItem "lastname", data.lastname
        localStorage.setItem "phone", data.phone
        $.mobile.changePage "profile.html"
      else
        $("#loginForm").reset()
        console.log "hay error en el Ajax"
        $.mobile.changePage "login.html"
      return
    ).fail (data) ->
      console.log "Fallo el Ajax"
      $.mobile.changePage "login.html"
    ```
    ###