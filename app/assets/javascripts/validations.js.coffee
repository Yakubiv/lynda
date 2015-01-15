$(document).on 'ready page:load', (e) ->
  $('#admin_email').attr('data-parsley-required-message', "Email cannot be blank")
  $('#admin_password').attr('data-parsley-required-message', "Password cannot be blank")
  $('#admin_password').attr('data-parsley-length', "[6]")
  $('#admin_password').attr('data-parsley-length-message', 'Password must be 6 characters or more')


  $("form").parsley()
