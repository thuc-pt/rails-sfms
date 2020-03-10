$(document).ready(function() {
  $('#sub_pitch_sub_pitch_type_id').on('change', function() {
    var text = $(this).find('option:selected').text();
    if (parseInt($(this).val()) > 0)
      $('#sub_pitch_name').val(text);
    else
      $('#sub_pitch_name').val('');
    condition_disable();
  });
  $('#sub_pitch_name').on('input', function() {
    condition_disable();
  });
  $('.edit-sub-pitch').on('click', function() {
    if ($(window).scrollTop() > 200)
      $([document.documentElement, document.body]).animate({
          scrollTop: 0
      }, 500);
  })
});
function condition_disable() {
  if(parseInt($('#sub_pitch_sub_pitch_type_id').val()) > 0 && $('#sub_pitch_name').val().length > 0)
    $('#submit-sub-pitch').removeAttr('disabled');
  else
    $('#submit-sub-pitch').prop('disabled', true);
}
