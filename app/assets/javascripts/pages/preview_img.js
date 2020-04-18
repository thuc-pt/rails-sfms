$(document).ready(function() {
  $(document).on('change', '#comment_image', function() {
    readImageCmt(this);
  });
});
function readImageCmt(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#view_img_cmt').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
