var app;

app = {
  initialize: function() {
    return this.bindEvents();
  },

  /*
  Bind any events that are required on startup. Common events are:
  'load', 'deviceready', 'offline', and 'online'.
   */
  bindEvents: function() {
    return document.addEventListener("deviceready", this.onDeviceReady, false);
  },

  /*
  The scope of `this` is the event. In order to
  call the `receivedEvent` function,
  we must explicity call `app.receivedEvent(...);`
   */
  onDeviceReady: function() {
    return app.receivedEvent("deviceready");
  },
  receivedEvent: function(id) {
    var listeningElement, parentElement, receivedElement;
    parentElement = document.getElementById(id);
    listeningElement = parentElement.querySelector(".listening");
    receivedElement = parentElement.querySelector(".received");
    listeningElement.setAttribute("style", "display:none;");
    receivedElement.setAttribute("style", "display:block;");
    return console.log("Received Event: " + id);
  }
};

$(document).on('pageinit', '#simulator', function(event) {
  var calculateCredit, clearData, round;
  console.log('ready for simulator');
  calculateCredit = function() {
    var amount, feeNumber, feeToPay, interestRate, tmp, tmpd, tmpn, totalInterest, totalPay;
    amount = $('#txt-amount').val();
    interestRate = $("#txt-interestRate").val();
    feeNumber = $("#txt-feeNumber").val();
    tmp = Math.pow(1 + (interestRate / 100), -feeNumber);
    tmpd = 1 - tmp;
    tmpn = amount * (interestRate / 100);
    feeToPay = round(tmpn / tmpd);
    totalPay = round(feeToPay * feeNumber);
    totalInterest = round(totalPay - amount);
    $("#txt-feeToPay").append('<span class="simulator">' + " $ " + feeToPay + '</span>');
    $("#txt-totalPay").append('<span class="simulator">' + " $ " + totalPay + '</span>');
    return $("#txt-totalInterest").append('<span class="simulator">' + " $ " + totalInterest + '</span>');
  };
  round = function(val) {
    var tmp;
    tmp = Math.round(val * 100) / 100 + "";
    if (tmp.indexOf(".") === -1) {
      tmp += ".00";
    } else {
      if (tmp.length - tmp.indexOf(".") === 2) {
        tmp += "0";
      }
    }
    return tmp;
  };
  clearData = function() {
    $("#txt-amount").val("");
    $("#txt-interestRate").val("");
    $("#txt-feeNumber").val("");
    $("#txt-feeToPay").remove('span.simulator');
    $("#txt-totalPay").remove('span.simulator');
    return $("#txt-totalInterest").remove('span.simulator');
  };
  $('#btnCalculateCredit').on('click', function() {
    console.log('click on calculateCredit');
    return calculateCredit();
  });
  return $('#btnResetSimulatorFields').on('click', function() {
    console.log('click on btnResetSimulatorFields');
    return clearData();
  });
});
