$(document).ready(function() {
  var arrLevel = [];
  $(document).on('change', '.checkbox-level', function() {
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
    requestServerByParams('list_teams/list_teams_by_params', "level_id=" + arrLevel);
  });
  $(document).on('click', '.tabs-province-team', function() {
    dataLink = {element: $(this).attr('href')};
    urlTab = $(this).attr('href');
    window.history.pushState('', '', urlTab);
    requestServerByParams('list_teams/list_teams_by_params', dataLink);
  });
  loadTabs();
});
