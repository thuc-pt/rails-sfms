class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_notifications, if: :user_signed_in?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
  end

  def load_notifications
    @notifications = Notification.of_user(current_user).page(params[:page]).per 5
    @number_notices = Notification.not_seen_of_user(current_user).size
    @receiver_id = current_user.id
  end
end
