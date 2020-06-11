$(document).ready(function() {
  $('#pitch_province_id, #pitch_district_id, #sub_pitch_sub_pitch_type_id, #pitch_booking, #team_province_id, #team_district_id, #team_level_id, #team_pitch_id, #match_team_id, #match_province_id, #match_district_id, #match_pitch_id, #match_level_id').select2();
  $('#team_member').select2({multiple: true, tags: true, tokenSeparators: [',']});
});
