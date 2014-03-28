jQuery.fn.reset = function() {
  return $(this).each(function() {
    return this.reset();
  });
};

$(document).on("pageinit", "#home", function() {
  console.log("Loading delegate event to home and login");
  if (sessionStorage.length === 0) {
    console.log("sessionStorage clean");
    $.mobile.changePage("#login");
  } else {
    $.mobile.changePage("#home");
  }
  return $("#lookCookie").on("click", function() {
    return $("#setCookie").append("<p>" + sessionStorage.getItem("cookie") + "</p>");
  });
});
