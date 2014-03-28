$(document).on('pageinit', '#simulator', function(event) {

  /*
  ``` html
  <form>
    <!-- test comment -->
    <input type="number" id="txt-amount" pattern="[0-9]*" placeholder="Digite el monto">
    <input type="number" id="txt-interestRate" placeholder="Digite tasa de interés (x.x%)">
    <input type="number" id="txt-feeNumber" pattern="[0-9]*" placeholder="Digite N° de cuotas pactadas">
    <button id="btnCalculateCredit" class="ui-btn ui-btn-b">Calcular</button>
    <label id="txt-feeToPay">Cuota a Pagar:</label>
    <label id="txt-totalPay">Valor Total Pagado:</label>
    <label id="txt-totalInterest">Total Interés Pagado:</label>
    <button class="ui-btn ui-btn-b" id="btnResetSimulatorFields">Nuevo</button>
  </form>
  ```
   */
  var calculateCredit, clearData, round;
  console.log('ready for simulator');
  calculateCredit = function() {
    var amount, feeNumber, feeToPay, interestRate, tmp, tmpd, tmpn, totalInterest, totalPay;
    amount = $('#txt-amount').val();
    interestRate = $('#txt-interestRate').val();
    feeNumber = $('#txt-feeNumber').val();
    tmp = Math.pow(1 + (interestRate / 100), -feeNumber);
    tmpd = 1 - tmp;
    tmpn = amount * (interestRate / 100);
    feeToPay = round(tmpn / tmpd);
    totalPay = round(feeToPay * feeNumber);
    totalInterest = round(totalPay - amount);
    $('#resultsCalculateCredit').append('<label id="txt-feeToPay">Cuota a Pagar:<strong class="simulator">' + ' $ ' + feeToPay + '</strong></label>');
    $('#resultsCalculateCredit').append('<label id="txt-totalPay">Valor Total Pagado:<strong class="simulator">' + ' $ ' + totalPay + '</strong></label>');
    return $('#resultsCalculateCredit').append('<label id="txt-totalInterest">Total Interés Pagado:<strong class="simulator">' + ' $ ' + totalInterest + '</strong></label>');
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
    $('#txt-amount').val("");
    $('#txt-interestRate').val("");
    $('#txt-feeNumber').val("");
    $('#txt-feeToPay').remove();
    $('#txt-totalPay').remove();
    return $('#txt-totalInterest').remove();
  };
  $('#btnCalculateCredit').on('click', function() {
    console.log('click on calculateCredit');
    calculateCredit();
    return event.preventDefault();
  });
  return $('#btnResetSimulatorFields').on('click', function() {
    console.log('click on btnResetSimulatorFields');
    clearData();
    return event.preventDefault();
  });
});
