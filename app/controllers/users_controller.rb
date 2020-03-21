class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def show; end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "flash.update_success"
      redirect_to @user
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def update_avatar
    if @user.update image: params[:user][:image]
      flash[:success] = t "flash.update_success"
    else
      flash[:danger] = t "flash.update_success"
    end
    redirect_back fallback_location: @user
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "flash.not_found"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit User::PARAMS
  end
end
