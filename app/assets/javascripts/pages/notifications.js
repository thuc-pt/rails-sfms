//= require ../cable

$(document).ready(function() {
  $(function() {
    App.notifications = App.cable.subscriptions.create({
      channel: 'NotificationsChannel'
    },
    {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        let received_id = $(data.notification).attr('data-receiver-id');
        let oldValue = parseInt($('#notification-counter-' + received_id).text());
        $('#notification-list-' + received_id).prepend(data.notification);
        $('#notification-counter-' + received_id).text(oldValue + 1);
      }
    });
  });

  $(function() {
    $("time.timeago").timeago();
  });
});
