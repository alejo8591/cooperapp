# ### Calculator for Loan Money

# ##### Code HTML of the form for the simulator in jQuery Mobile

# ##### Delegate event for page `simulator`
# Delegate event to load the DOM for the id page `simulator` with `pageinit`

$(document).on 'pageinit', '#simulator', (event)->
  ###
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
  ###

  console.log 'ready for simulator'
  # #### Functions

  # ##### Function `calculateCredit`
  # Function to calculate the loan amount according to the form in HTML
  calculateCredit = ->
    amount = $('#txt-amount').val()
    interestRate = $('#txt-interestRate').val()
    feeNumber = $('#txt-feeNumber').val()
    tmp = Math.pow((1 + (interestRate / 100)), (-feeNumber))
    tmpd = 1 - tmp
    tmpn = amount * (interestRate / 100)
    feeToPay = round(tmpn / tmpd)
    totalPay = round(feeToPay * feeNumber)
    totalInterest = round(totalPay - amount)
    $('#resultsCalculateCredit').append '<label id="txt-feeToPay">Cuota a Pagar:<strong class="simulator">' + ' $ ' + feeToPay + '</strong></label>'
    $('#resultsCalculateCredit').append '<label id="txt-totalPay">Valor Total Pagado:<strong class="simulator">' + ' $ ' + totalPay + '</strong></label>'
    $('#resultsCalculateCredit').append '<label id="txt-totalInterest">Total Interés Pagado:<strong class="simulator">' + ' $ ' + totalInterest + '</strong></label>'
  
  # ##### Function `round`
  # supplementing function `calculateCredit` to round values ​​in JS
  round = (val) ->
    tmp = Math.round(val * 100) / 100 + ""
    if tmp.indexOf(".") is -1
      tmp += ".00"
    else tmp += "0"  if (tmp.length - tmp.indexOf(".") is 2)
    tmp

  # ##### Function `clearData`
  # Function to clean result fields of the form
  clearData = ->
    $('#txt-amount').val ""
    $('#txt-interestRate').val ""
    $('#txt-feeNumber').val ""
    $('#txt-feeToPay').remove()
    $('#txt-totalPay').remove()
    $('#txt-totalInterest').remove()
  
  # #### Events
  # Listen Events with jQuery

  # #### Event `#btnCalculateCredit`
  # Event `#btnCalculateCredit` to calculate loan with `calculateCredit`
  $('#btnCalculateCredit').on 'click', ->
    console.log 'click on calculateCredit'
    calculateCredit()
    event.preventDefault()

  # #### Event `#btnResetSimulatorFields`
  # Event `#btnResetSimulatorFields` reset fields and clean info with `calculateCredit`
  $('#btnResetSimulatorFields').on 'click', ->
    console.log 'click on btnResetSimulatorFields'
    clearData()
    event.preventDefault()
