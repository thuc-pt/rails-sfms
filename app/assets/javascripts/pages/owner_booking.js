$(document).ready(function() {
  $(document).on('click', '.btn-show-booking-form', function() {
    $.ajax({
      method: 'GET',
      url: '/pitches/' + $(this).attr('data-pid') + '/owner_bookings/new?timesheet_id=' + $(this).attr('data-id')
    });
  });
  $(document).on('click', '.btn-edit-booking', function() {
    $.ajax({
      method: 'GET',
      url: '/pitches/' + $(this).attr('data-pid') + '/owner_bookings/edit_infor?timesheet_id=' + $(this).attr('data-id') + '&date=' + $('#owner-date-booking-index').val()
    });
  });
  $('#owner-date-booking-index').datepicker({dateFormat: 'yy-mm-dd', minDate: 0});
  $(document).on('change', '#owner-date-booking-index', function() {
    $.ajax({
      method: 'GET',
      url: '/pitches/' + $(this).attr('data-pid') + '/owner_bookings/change_date?date=' + $(this).val()
    })
  });
});
