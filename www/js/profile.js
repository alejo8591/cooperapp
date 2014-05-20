$(document).on('pageinit', '#profile', function(event) {
  console.log("Building DOM from profile to profile");
  $('#dataInfo').remove('.info');
  console.log($('#dataInfo').children().length);
  if ($('#dataInfo').children().length === 0) {
    $('#dataInfo').append('<li><a href="#" class="info">' + localStorage.getItem('firstname') + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem('lastname') + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem('email') + '</a></li>' + '<li><a href="#" class="info">' + localStorage.getItem('phone') + '</a></li>');
    return $('#dataInfo').listview('refresh');
  }
});
