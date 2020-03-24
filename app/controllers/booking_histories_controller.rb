class BookingHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.of_user(current_user.id).includes(timesheet: [sub_pitch: [pitch: [:province, :district]]])
                       .page(params[:page]).per 10
  end

  def destroy
    @booking = Booking.find_by id: params[:id]
    @booking.destroy
    respond_to do |format|
      format.js
    end
  end
end
