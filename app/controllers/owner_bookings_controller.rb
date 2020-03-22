class OwnerBookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_pitch, only: %i(index edit_infor change_date)
  before_action :load_timesheet, only: %i(index change_date)
  before_action :load_placed, only: %i(index new)
  before_action :load_booking, only: %i(update destroy)
  before_action :rollback_booking, only: %i(create update)

  def index; end

  def change_date
    @placed = Booking.confirm_in_date(params[:date]).group_by(&:timesheet_id)
  end

  def new
    @booking = Booking.new
    @timesheet = Timesheet.find_by id: params[:timesheet_id]
  end

  def edit_infor
    @booking = Booking.find_by timesheet_id: params[:timesheet_id], date: params[:date]
  end

  def create
    @booking = Booking.new booking_params
    if @booking.save
      flash[:success] = t "flash.booking_susc"
      redirect_back fallback_location: root_path
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    if @booking.update booking_params
      flash[:success] = t "flash.update_success"
      redirect_back fallback_location: root_path
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @booking.destroy
    flash[:success] = t "flash.delete_success"
    redirect_back fallback_location: root_path
  end

  private

  def load_pitch
    @pitch = Pitch.find_by id: params[:pitch_id]
    return if @pitch

    flash[:danger] = t "flash.not_found"
    redirect_to root_path
  end

  def load_timesheet
    @timesheets = Timesheet.in_pitch(@pitch.id).includes(:sub_pitch)
                           .group_by{|time| [time.sub_pitch_name, time.sub_pitch_id]}
  end

  def load_placed
    @placed = Booking.confirm_in_date.group_by(&:timesheet_id)
  end

  def booking_params
    params.require(:booking).permit Booking::PARAMS
  end

  def load_booking
    @booking = Booking.find_by id: params[:id]
    return if @booking

    flash[:danger] = t "flash.not_found"
    redirect_to root_path
  end

  def rollback_booking
    exist = Booking.already_exist params[:booking][:date], params[:booking][:timesheet_id]
    timesheet = Timesheet.find_by id: params[:booking][:timesheet_id]
    return if correct_conditions exist, timesheet

    flash[:danger] = t "flash.cant_booking"
    redirect_back fallback_location: root_path
  end

  def correct_conditions exist, timesheet
    exist.blank? && (timesheet.start_at.strftime("%H:%M") > Time.now.strftime("%H:%M") ||
      params[:booking][:date].to_date > Date.current ||
      params[:booking][:date].to_date == Date.current &&
        timesheet.start_at.strftime("%H:%M") > Time.now.strftime("%H:%M"))
  end
end
