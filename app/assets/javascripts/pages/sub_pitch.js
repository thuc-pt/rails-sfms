$(document).ready(function() {
  $(document).on('change', '#sub_pitch_sub_pitch_type_id', function() {
    var text = $(this).find('option:selected').text();
    if (parseInt($(this).val()) > 0)
      $('#sub_pitch_name').val(text);
    else
      $('#sub_pitch_name').val('');
    condition_disable();
  });
  $(document).on('input', '#sub_pitch_name', function() {
    condition_disable();
  });
  $(document).on('click', '.edit-sub-pitch', function() {
    if ($(window).scrollTop() > 200)
      $([document.documentElement, document.body]).animate({
          scrollTop: 0
      }, 1000);
  })
});
function condition_disable() {
  if(parseInt($('#sub_pitch_sub_pitch_type_id').val()) > 0 && $('#sub_pitch_name').val().length > 0)
    $('#submit-sub-pitch').removeAttr('disabled');
  else
    $('#submit-sub-pitch').prop('disabled', true);
}
