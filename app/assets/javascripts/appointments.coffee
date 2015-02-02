$(document).ready ->
  $(document).on "change", "#radio_button", ->
    console.log this
    console.log $(this).find("#appointment_is_new_customer_false")[0].checked
    console.log $(".customer")
    if $(this).find("#appointment_is_new_customer_false")[0].checked
      $(".old_customer").show()
      $(".customer").addClass "none_customer"
    else
      $("form-group, .none_customer").removeClass "none_customer"
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