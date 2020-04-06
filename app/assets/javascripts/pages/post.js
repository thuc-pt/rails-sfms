$(document).ready(function() {
  $(document).on('input', '#post_content', function() {
    if ($(this).val().length > 0)
      $('#btn-form-post').removeAttr('disabled');
    else
      $('#btn-form-post').prop('disabled', true);
  });
  $(document).on('change', '#post_image', function() {
    readImage(this);
  });
});
