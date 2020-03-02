class Users::OmniauthCallbacksController < ApplicationController
  def facebook
    generic_callback :facebook
  end

  def google_oauth2
    generic_callback :google_oauth2
  end

  def generic_callback provider
    user = User.from_omniauth request.env["omniauth.auth"]
    if user.persisted?
      sign_in_and_redirect user
      flash[:success] = I18n.t(".sign_in_success")
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      flash[:danger] = I18n.t(".sign_in_failure")
      redirect_to new_user_registration_path
    end
  end

  def failure
    flash[:danger] = I18n.t(".sign_in_failure")
    redirect_to new_user_session_path
  end
end
