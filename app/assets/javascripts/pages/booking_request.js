$(document).ready(function() {
  $('#pitch_booking').on('change', function() {
    $.ajax({
      method: 'GET',
      url: '/booking_requests/list_booking_by_params?pitch_id=' + $(this).find('option:selected').val();
    });
  });
});
