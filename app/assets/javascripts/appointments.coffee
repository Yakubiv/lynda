$(document).ready ->
  $(document).on "change", "#radio_button", ->
    console.log this
    console.log $(this).find("#appointment_is_new_customer_false")[0].checked
    console.log $(".customer")
    if $(this).find("#appointment_is_new_customer_false")[0].checked
      $(".old_customer").show()
      $(".customer").addClass "first_time"
    else
      $("form-group, .first_time").removeClass "first_time"
      $(".old_customer").hide()
    return

  return
$(document).ready ->
  $ ->
    $('#datetimepicker1').datetimepicker sideBySide: true
    return
  return

$(document).ready ->
  $("#radio-cancel").hide()

$(document).ready ->
  $('[data-toggle=offcanvas]').click ->
    $('.row-offcanvas').toggleClass 'active'
    return
  return
