$(document).ready(function() {
  district_id = $('#pitch_district_id').html();
  province = $('#pitch_province_id :selected').text();
  district = $('#pitch_district_id :selected').text();
  opt_district = $(district_id).filter('optgroup[label=\"'+province+'\"]').html();
  $('#pitch_district_id').html(opt_district);
  $('#pitch_province_id').on("change", function() {
    province = $('#pitch_province_id :selected').text();
    opt_district = $(district_id).filter('optgroup[label=\"'+province+'\"]').html();
    $('#pitch_district_id').html(opt_district);
  });
  // Preview image when upload
  function readImage(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#preview_image').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#pitch_image').on("change", function() {
    readImage(this);
  });
  $('#pitch_open_at, #pitch_close_at').timepicker();
});
