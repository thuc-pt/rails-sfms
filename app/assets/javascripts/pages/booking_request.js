$(document).ready(function() {
  $(document).on('change', '#pitch_booking', function() {
    $.ajax({
      method: 'GET',
      url: '/booking_requests/list_booking_by_params?pitch_id=' + $(this).find('option:selected').val()
    });
  });
});
