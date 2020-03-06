$(document).ready(function() {
  $('#user_image').on('change', function () {
     $('#update_avatar').submit();
  });
  $('#user_current_password, #user_password, #user_password_confirmation').on('input', function() {
    if ($('#user_current_password').val().length > 5 && $('#user_password').val().length > 5 && $('#user_password_confirmation').val().length > 5)
      $('#change-password').removeAttr('disabled');
    else
      $('#change-password').prop('disabled', true);
  });
  $('#user_birthday').datepicker({dateFormat: 'yy-mm-dd'});
});
