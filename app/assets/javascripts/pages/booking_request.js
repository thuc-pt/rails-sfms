$(document).ready(function() {
  $('#pitch_booking').on('change', function() {
    $.ajax({
      method: 'GET',
      url: '/booking_requests/list_booking_by_params?pitch_id=' + $(this).find('option:selected').val()
    });
  });
  $('.booking-date').datepicker({dateFormat: 'yy-mm-dd', minDate: 0});
  $('.booking-date').on('change', function() {
    $.ajax({
      method: 'GET',
      url: '/bookings/check_condition?date=' + $(this).val() + '&timesheet_id=' + $(this).attr('data-id')
    });
  });
});
