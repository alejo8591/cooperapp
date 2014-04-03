$(document).on("pageinit", "#editProfile", function(event) {
  console.log("Building DOM editing profile");
  $("input#userEmailEditProfile").val(localStorage.getItem("email")).attr("disabled", "disabled");
  $("input#firtsnameEditProfile").val(localStorage.getItem("firstname"));
  $("input#lastnameEditProfile").val(localStorage.getItem("lastname"));
  $("input#phoneEditProfile").val(localStorage.getItem("phone"));
  $("#updateProfile").on("click", function() {
    var update_data;
    if ($("input#firtsnameEditProfile").val() !== "" && $("input#lastnameEditProfile").val() !== "" && $("input#phoneEditProfile").val() !== "") {
      update_data = {};
      update_data.cookie = '5852c0ef0719d1e0922e8e9806a4f5aa';
      update_data.email = localStorage.getItem("email");
      if (localStorage.getItem("firstname") !== $("input#firtsnameEditProfile").val()) {
        update_data.firstname = $("input#firtsnameEditProfile").val();
      } else {
        update_data.firstname = localStorage.getItem("firstname");
      }
      if (localStorage.getItem("lastname") !== $("input#lastnameEditProfile").val()) {
        update_data.lastname = $("input#lastnameEditProfile").val();
      } else {
        update_data.lastname = localStorage.getItem("lastname");
      }
      if (localStorage.getItem("phone") !== $("input#phoneEditProfile").val()) {
        update_data.phone = $("input#phoneEditProfile").val();
      } else {
        update_data.phone = localStorage.getItem("phone");
      }
      console.log(update_data);
      sessionStorage.setItem("cookie", update_data.cookie);
      localStorage.setItem("email", update_data.email);
      localStorage.setItem("firstname", update_data.firstname);
      localStorage.setItem("lastname", update_data.lastname);
      localStorage.setItem("phone", update_data.phone);
      console.log(localStorage.getItem('firstname') + ', ' + localStorage.getItem('lastname') + ', ' + localStorage.getItem('phone') + ', ' + sessionStorage.getItem('cookie'));

      /*
      $(document).on 'pageinit', '#profile', (event) ->
        console.log "Building Profile from DOM to createUser"
        $('#dataInfo').remove '.info'
        console.log $('#dataInfo').children().length
        if $('#dataInfo').children().length is 0 or $('#dataInfo').children().length is 4
          $('#dataInfo').append '<li><a href="#" class="info">' + localStorage.getItem(firstname) + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem(lastname) + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem(email) + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem(phone) + '</a></li>'
          $('#dataInfo').listview 'refresh'
       */
      return $.mobile.changePage('#profile');
    } else {
      return alert('Hay campos en blanco');
    }
  });
  $("#deleteUser").on("click", function() {
    console.log("click on delete");
    sessionStorage.removeItem("cookie");
    localStorage.removeItem("email");
    localStorage.removeItem("firstname");
    localStorage.removeItem("lastname");
    localStorage.removeItem("phone");
    $('#loginForm').reset();
    $('#createUserForm').reset();
    if (sessionStorage.length === 0) {
      console.log("sessionStorage clean");
      return $.mobile.changePage("#login");
    } else {
      return $.mobile.changePage("#home");
    }
  });
  return $("#logout").on("click", function() {
    console.log("click on logout");
    sessionStorage.removeItem("cookie");
    $('#loginForm').reset();
    $('#createUserForm').reset();
    if (sessionStorage.length === 0) {
      console.log("sessionStorage clean");
      return $.mobile.changePage("#login");
    } else {
      return $.mobile.changePage("#home");
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
