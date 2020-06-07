class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    Notification.of_user(current_user).update_all seen: true
    @all_notifications = Notification.of_user current_user
  end

  def update_seen_notice
    @notice = Notification.find_by id: params[:id]
    @notice.update seen: true
    respond_to do |format|
      format.js
    end
  end
end
