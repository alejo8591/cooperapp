$(document).on("pageinit", "#editProfile", function(event) {
  console.log("Building DOM editing profile");
  $("input#userEmail").val(localStorage.getItem("email")).attr("disabled", "disabled");
  $("input#firstname").val(localStorage.getItem("firstname"));
  $("input#lastname").val(localStorage.getItem("lastname"));
  $("input#phone").val(localStorage.getItem("phone"));
  return $("#updateProfile").on("click", function() {
    var update_data;
    if ($("input#firstname").val() !== "" && $("input#lastname").val() !== "" && $("input#phone").val() !== "") {
      update_data = {};
      update_data.email = localStorage.getItem("email");
      if (localStorage.getItem("firstname") !== $("input#firstname").val()) {
        update_data.firstname = $("input#firstname").val();
      } else {
        update_data.firstname = localStorage.getItem("firstname");
      }
      if (localStorage.getItem("lastname") !== $("input#lastname").val()) {
        update_data.lastname = $("input#lastname").val();
      } else {
        update_data.lastname = localStorage.getItem("lastname");
      }
      if (localStorage.getItem("phone") !== $("input#phone").val()) {
        update_data.phone = $("input#phone").val();
      } else {
        update_data.phone = localStorage.getItem("phone");
      }
      console.log(update_data);
      sessionStorage.setItem("cookie", update_data.cookie);
      localStorage.setItem("email", update_data.email);
      localStorage.setItem("firstname", update_data.firstname);
      localStorage.setItem("lastname", update_data.lastname);
      localStorage.setItem("phone", update_data.phone);
      return $.mobile.changePage('#profile');
    } else {
      return alert('Hay campos en blanco');
    }

    /*
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
     */
  });
});
