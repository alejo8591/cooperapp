$(document).on("pageinit", "#login", function(event) {
  console.log("Loading delegate event for login");
  return $("#loginUser").on("click", function() {
    var cookie, email, password;
    console.log("click on login");
    email = $("#userEmail").val();
    password = $("#userPassword").val();
    if (email !== "" && password !== "" && email === localStorage.getItem('email') && password === localStorage.getItem('password')) {
      cookie = '5852c0ef0719d1e0922e8e9806a4f5aa';
      if (sessionStorage.getItem('cookie' !== cookie || sessionStorage.length === 0)) {
        sessionStorage.setItem('cookie', cookie);
      }
      return $.mobile.changePage('#index');
    } else {
      $("#loginForm").reset();
      return $.mobile.changePage('#login');
    }

    /*
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
     */
  });
});
