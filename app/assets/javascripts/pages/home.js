$(document).ready(function() {
  var dataLink;
  $(document).on('click', '.tabs-province', function() {
    provinceName = $(this).text().replace(/[0-9]/g, '');
    dataLink = {element: $(this).attr('href')};
    urlTab = 'home' + $(this).attr('href');
    if (urlTab == 'home#all')
      $('.field-address').html('<i class="fas fa-futbol"></i>Tất cả sân bóng')
    else
      $('.field-address').html('<i class="fas fa-futbol"></i>Sân bóng tại ' + provinceName)
    window.history.pushState('', '', urlTab);
    requestServerByParams('list_pitches_by_province', dataLink);
  });
  loadTabs();
  var arrDistrict = [];
  $(document).on('change', '.checkbox-district', function() {
    if ($(this).is(':checked'))
      arrDistrict.push($(this).attr('data-id'));
    else {
      for(i = 0; i < arrDistrict.length; i++)
        if(arrDistrict[i] === $(this).attr('data-id')) {
          arrDistrict[i] = null;
          break;
        }
    }
    requestServerByParams('list_pitches_by_district?district=' + arrDistrict, dataLink)
  });
});
function requestServerByParams(url, data) {
  $('#screen-loading').show();
  $.ajax({url: url, method: 'GET', data: data, success: function() {$('#screen-loading').delay(1000).fadeOut();}});
}
function loadTabs() {
  let hash = window.location.hash.split('?')[0];
  if (hash)
    $('#load-' + hash.split('#')[1]).click();
  $('#tabs-province').on('show.bs.tab', function(e) {
    window.location.hash = e.target.hash
  });
}
$(document).on('click', '.page', function() {
  if ($(window).scrollTop() > 200)
    $([document.documentElement, document.body]).animate({
        scrollTop: 0
    }, 500);
});
