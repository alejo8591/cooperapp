# #### Calculator functions
$(document).on 'pageinit', '#simulator', (event)->
  console.log 'ready for simulator'
  calculateCredit = ->
    amount = $('#txt-amount').val()
    interestRate = $("#txt-interestRate").val()
    feeNumber = $("#txt-feeNumber").val()
    tmp = Math.pow((1 + (interestRate / 100)), (-feeNumber))
    tmpd = 1 - tmp
    tmpn = amount * (interestRate / 100)
    feeToPay = round(tmpn / tmpd)
    totalPay = round(feeToPay * feeNumber)
    totalInterest = round(totalPay - amount)
    $("#txt-feeToPay").append '<span class="simulator">' + " $ " + feeToPay + '</span>'
    $("#txt-totalPay").append '<span class="simulator">' + " $ " + totalPay + '</span>'
    $("#txt-totalInterest").append '<span class="simulator">' + " $ " + totalInterest + '</span>'

  round = (val) ->
    tmp = Math.round(val * 100) / 100 + ""
    if tmp.indexOf(".") is -1
      tmp += ".00"
    else tmp += "0"  if (tmp.length - tmp.indexOf(".") is 2)
    tmp

  clearData = ->
    $("#txt-amount").val ""
    $("#txt-interestRate").val ""
    $("#txt-feeNumber").val ""
    $("#txt-feeToPay").remove 'span.simulator'
    $("#txt-totalPay").remove 'span.simulator'
    $("#txt-totalInterest").remove 'span.simulator'

  $('#btnCalculateCredit').on 'click', ->
    console.log 'click on calculateCredit'
    calculateCredit()

  $('#btnResetSimulatorFields').on 'click', ->
    console.log 'click on btnResetSimulatorFields'
    clearData()