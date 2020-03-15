class BookingsController < ApplicationController
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

  def booking_params
    params.require(:booking).permit Booking::PARAMS
  end
end
