$(document).on "pageinit", "#login", (event) ->
  console.log "Loading delegate event for login"
  $("#loginUser").on "click", ->
    console.log "click on login"
    email = $("#userEmailLogin").val()
    password = $("#userPasswordLogin").val()
    cookie = '5852c0ef0719d1e0922e8e9806a4f5aa'

    sessionStorage.setItem 'cookie', cookie

    console.log "values localStorage: " + localStorage.getItem('email') + ', ' + localStorage.getItem('password') + ', ' + sessionStorage.getItem('cookie')

    console.log "values intro: " + email + ', ' +password


    if email isnt "" and password isnt "" and email is localStorage.getItem('email') and password is localStorage.getItem('password') and sessionStorage.length > 0

      if sessionStorage.getItem('cookie') isnt cookie or sessionStorage.length is 0
        sessionStorage.setItem 'cookie', cookie
        $.mobile.changePage '#home'
      else
        $.mobile.changePage '#home'
    else
      $("#loginForm").reset()
      $.mobile.changePage '#login'
    ###
    ``` javascript
    $.ajax(
      type: "POST"
      url: "http://127.0.0.1:3000/api/v1/user/login"
      dataType: "json"
      data:
        email: email
        password: password
    ).done((data) ->
      if data.error is `undefined`
        sessionStorage.setItem "cookie", data.cookie
        localStorage.setItem "email", data.email
        localStorage.setItem "firstname", data.firstname
        localStorage.setItem "lastname", data.lastname
        localStorage.setItem "password", data.password
        localStorage.setItem "phone", data.phone
        $.mobile.changePage "index.html"
      else
        $("#loginForm").reset()
        $.mobile.changePage "login.html"
      return
    ).fail (data) ->
      $.mobile.changePage "login.html"
    ```
    ###
