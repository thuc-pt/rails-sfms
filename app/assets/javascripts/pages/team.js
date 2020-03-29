$(document).ready(function() {
  district_id = $('#team_district_id').html();
  province = $('#team_province_id :selected').text();
  district = $('#team_district_id :selected').text();
  opt_district = $(district_id).filter('optgroup[label=\"'+province+'\"]').html();
  $('#team_district_id').html(opt_district);
  $(document).on('change', '#team_province_id', function() {
    province = $('#team_province_id :selected').text();
    opt_district = $(district_id).filter('optgroup[label=\"'+province+'\"]').html();
    $('#team_district_id').html(opt_district);
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
  function readLogo(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#preview_logo').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $(document).on('change', '#team_image', function() {
    readImage(this);
  });
  $(document).on('change', '#team_logo', function() {
    readLogo(this);
  });
});
