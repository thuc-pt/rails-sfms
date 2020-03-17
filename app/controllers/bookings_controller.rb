class BookingsController < ApplicationController
  before_action :load_booking, only: %i(destroy confirm_request)

  def create
    @booking = Booking.new booking_params
    if @booking.save
      flash[:success] = t "flash.booking_success"
      redirect_back fallback_location: root_path
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.js
    end
  end

  def confirm_request
    @booking.confirm!
    respond_to do |format|
      format.js
    end
  end

  private

  def booking_params
    params.require(:booking).permit Booking::PARAMS
  end

  def load_booking
    @booking = Booking.find_by id: params[:id]
    return if @booking

    flash[:danger] = t "flash.not_found"
    redirect_back fallback_location: root_path
  end
end
