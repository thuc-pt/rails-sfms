$(document).ready(function() {
  var district_id = $('#pitch_district_id').html();
  province = $('#pitch_province_id :selected').text();
  opt_district = $(district_id).filter('optgroup[label=\"'+province+'\"]').html();
  $('#pitch_district_id').html(opt_district);
  $(document).on('change', '#pitch_province_id', function() {
    province = $('#pitch_province_id :selected').text();
    opt_district = $(district_id).filter('optgroup[label=\"'+province+'\"]').html();
    $('#pitch_district_id').html(opt_district);
  });
  // Preview image when upload
  $(document).on('change', '#pitch_image', function() {
    readImage(this);
  });
  $('#pitch_open_at, #pitch_close_at').timepicker();
});
function readImage(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#preview_image').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
