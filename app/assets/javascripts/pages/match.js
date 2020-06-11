$(document).ready(function() {
  $('#match_time').datepicker();
  var district_id = $('#match_district_id').html();
  province = $('#match_province_id :selected').text();
  opt_district = $(district_id).filter('optgroup[label=\"'+province+'\"]').html();
  $('#match_district_id').html(opt_district);
  $(document).on('change', '#match_province_id', function() {
    province = $('#match_province_id :selected').text();
    opt_district = $(district_id).filter('optgroup[label=\"'+province+'\"]').html();
    $('#match_district_id').html(opt_district);
  });
  var arrLevel = [];
  $(document).on('change', '.checkbox-level-match', function() {
    if ($(this).is(':checked'))
      arrLevel.push($(this).attr('data-id'));
    else {
      for(i = 0; i < arrLevel.length; i++)
        if(arrLevel[i] === $(this).attr('data-id')) {
          arrLevel[i] = null;
          break;
        }
    }
    $('#screen-loading').show();
    requestServerByParams('matches/list_matches_by_params', "level_id=" + arrLevel);
  });
  $(document).on('click', '.tabs-province-match', function() {
    dataLink = {element: $(this).attr('href')};
    urlTab = $(this).attr('href');
    window.history.pushState('', '', urlTab);
    $('#screen-loading').show();
    requestServerByParams('matches/list_matches_by_params', dataLink);
  });
  loadTabs();
});
