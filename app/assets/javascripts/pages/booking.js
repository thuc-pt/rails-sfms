$(document).ready(function() {
  $(document).on('change', '.pitch-booking-date', function() {
    $.ajax({
      method: 'GET',
      url: '/bookings/audit_conditions?date=' + $(this).val() + '&timesheet_id=' + $(this).attr('data-id')
    });
  });
  $(document).on('click', '.pitch-btn-booking', function() {
    $.ajax({
      method: 'GET',
      url: '/bookings/new?timesheet_id=' + $(this).attr('data-id')
    });
  });
});
