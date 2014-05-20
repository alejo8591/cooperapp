$(document).on "pageinit", "#editProfile", (event) ->
  console.log "Building DOM editing profile"
  $("input#userEmailEditProfile").val(localStorage.getItem("email")).attr "disabled", "disabled"
  $("input#firtsnameEditProfile").val localStorage.getItem("firstname")
  $("input#lastnameEditProfile").val localStorage.getItem("lastname")
  $("input#phoneEditProfile").val localStorage.getItem("phone")
  
  $("#updateProfile").on "click", ->
    if $("input#firtsnameEditProfile").val() isnt "" and $("input#lastnameEditProfile").val() isnt "" and $("input#phoneEditProfile").val() isnt ""
      update_data = {}
      update_data.cookie = '5852c0ef0719d1e0922e8e9806a4f5aa'
      update_data.email = localStorage.getItem("email")
      if localStorage.getItem("firstname") isnt $("input#firtsnameEditProfile").val()
        update_data.firstname = $("input#firtsnameEditProfile").val()
      else
        update_data.firstname = localStorage.getItem("firstname")
      if localStorage.getItem("lastname") isnt $("input#lastnameEditProfile").val()
        update_data.lastname = $("input#lastnameEditProfile").val()
      else
        update_data.lastname = localStorage.getItem("lastname")
      if localStorage.getItem("phone") isnt $("input#phoneEditProfile").val()
        update_data.phone = $("input#phoneEditProfile").val()
      else
        update_data.phone = localStorage.getItem("phone")
      console.log update_data

      sessionStorage.setItem "cookie", update_data.cookie
      localStorage.setItem "email", update_data.email
      localStorage.setItem "firstname", update_data.firstname
      localStorage.setItem "lastname", update_data.lastname
      localStorage.setItem "phone", update_data.phone

      console.log localStorage.getItem('firstname') + ', ' + localStorage.getItem('lastname') + ', ' + localStorage.getItem('phone') + ', ' + sessionStorage.getItem('cookie')
      ###
      $(document).on 'pageinit', '#profile', (event) ->
        console.log "Building Profile from DOM to createUser"
        $('#dataInfo').remove '.info'
        console.log $('#dataInfo').children().length
        if $('#dataInfo').children().length is 0 or $('#dataInfo').children().length is 4
          $('#dataInfo').append '<li><a href="#" class="info">' + localStorage.getItem(firstname) + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem(lastname) + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem(email) + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem(phone) + '</a></li>'
          $('#dataInfo').listview 'refresh'
      ###
      $.mobile.changePage '#profile'
    else
      alert 'Hay campos en blanco'

  $("#deleteUser").on "click", ->
    console.log "click on delete"
    sessionStorage.removeItem "cookie"
    localStorage.removeItem "email"
    localStorage.removeItem "firstname"
    localStorage.removeItem "lastname"
    localStorage.removeItem "phone"
    $('#loginForm').reset()
    $('#createUserForm').reset()
    if sessionStorage.length is 0
      # cargando login por no estar logeado
      console.log "sessionStorage clean"
      $.mobile.changePage "#login"
    else
      $.mobile.changePage "#home"

  $("#logout").on "click", ->
    console.log "click on logout"
    sessionStorage.removeItem "cookie"
    $('#loginForm').reset()
    $('#createUserForm').reset()
    if sessionStorage.length is 0
      # cargando login por no estar logeado
      console.log "sessionStorage clean"
      $.mobile.changePage "#login"
    else
      $.mobile.changePage "#home"
    
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