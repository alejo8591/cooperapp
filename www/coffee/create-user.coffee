$(document).on "pageinit", "#createUser", (event) ->
  console.log "Loading delegate event to createUser"
  $("#saveUser").on "click", ->
    console.log "Click on SaveUser"
    email = $("#userEmailCreateUser").val()
    firstname = $("#firstnameCreateUser").val()
    lastname = $("#lastnameCreateUser").val()
    phone = $("#phoneCreateUser").val()
    password = $("#userPasswordCreateUser").val()
    # hash created with [Free online md5 hash calculator](http://md5-hash-online.waraxe.us/)
    cookie = '5852c0ef0719d1e0922e8e9806a4f5aa'

    if email isnt "" and firstname isnt "" and lastname isnt "" and phone isnt "" and password isnt ""
      sessionStorage.setItem "cookie", cookie
      localStorage.setItem "email", email
      localStorage.setItem "firstname", firstname
      localStorage.setItem "lastname", lastname
      localStorage.setItem "password", password
      localStorage.setItem "phone", phone
      $(document).on 'pageinit', '#profile', (event) ->
        console.log "Building Profile from DOM to createUser"
        $('#dataInfo').remove '.info'
        console.log $('#dataInfo').children().length
        if $('#dataInfo').children().length is 0
          $('#dataInfo').append '<li><a href="#" class="info">' + localStorage.getItem(firstname) + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem(lastname) + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem(email) + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem(phone) + '</a></li>'
          $('#dataInfo').listview 'refresh'
          
      $.mobile.changePage '#profile'
    else
      console.log email + ', ' + firstname + ', ' + lastname + ', ' + phone + ', ' + password
      $("#createUserForm").reset()
      alert 'Ingrese todos los datos'
    ###
    ``` javascript
    $.ajax(
      type: "POST"
      url: "http://127.0.0.1:3000/api/v1/user/create"
      dataType: "json"
      data:
        email: email
        firstname: firstname
        lastname: lastname
        phone: phone
        password: password
    ).done((data) ->
      if data.error is `undefined`
        sessionStorage.setItem "cookie", data.cookie
        localStorage.setItem "email", data.email
        localStorage.setItem "firstname", data.firstname
        localStorage.setItem "lastname", data.lastname
        localStorage.setItem "password", data.password
        localStorage.setItem "phone", data.phone
        $(document).on "pageinit", "#profile", (event) ->
          console.log "Cosnstruyendo DOM para Profile desde create-user"
          $("#dataInfo").remove ".info"
          console.log $("#dataInfo").children().length
          if $("#dataInfo").children().length is 0
            $("#dataInfo").append "<li><a href=\"#\" class=\"info\">" + data.firstname + "</a></li>" + "<li><a href=\"#\" class=\"info\">" + data.lastname + "</a></li>" + "<li><a href=\"#\" class=\"info\">" + data.email + "</a></li>" + "<li><a href=\"#\" class=\"info\">" + data.phone + "</a></li>"
            $("#dataInfo").listview "refresh"
      

        $.mobile.changePage "profile.html"
      else
        $("#createUserForm").reset()
        $.mobile.changePage "login.html"
  
    ).fail (data) ->
      $.mobile.changePage "login.html"
    ```
    ###
