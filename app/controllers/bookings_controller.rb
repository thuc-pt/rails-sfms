class BookingsController < ApplicationController
  before_action :load_booking, only: %i(destroy confirm_request)
  before_action :rollback_booking, only: :create

  def check_condition
    @booking = Booking.already_exist params[:date], params[:timesheet_id]
    @timesheet = Timesheet.find_by id: params[:timesheet_id]
  end

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

  def rollback_booking
    exist = Booking.already_exist params[:booking][:date], params[:booking][:timesheet_id]
    timesheet = Timesheet.find_by id: params[:booking][:timesheet_id]
    return if exist.blank? && params[:booking][:date].to_date ||
              timesheet.start_at.strftime("%H:%M") > Time.now.strftime("%H:%M")

    flash[:danger] = t "flash.cant_booking"
    redirect_back fallback_location: root_path
  end
end
