class PitchesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :load_pitch, except: %i(index new create)
  before_action :load_timesheets, :load_pitches_on_the_same_area, :load_for_booking, only: :show

  def index
    @pitches = Pitch.correct_pitches(current_user.id).includes :province, :district
  end

  def show; end

  def new
    @pitch = Pitch.new
  end

  def edit; end

  def create
    @pitch = current_user.pitches.new pitch_params
    if @pitch.save
      flash[:success] = t "flash.create_success"
      redirect_to pitches_path
    else
      render :new
    end
  end

  def update
    if @pitch.update pitch_params
      flash[:success] = t "flash.update_success"
      redirect_to pitches_path
    else
      render :edit
    end
  end

  def destroy
    if @pitch.destroy
      @pitch_surplus = Pitch.correct_pitches current_user.id
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t "flash.delete_failure"
      redirect_to pitches_path
    end
  end

  def toggle_activation
    @pitch.toggle! :active
    respond_to do |format|
      format.js
    end
  end

  private

  def pitch_params
    params.require(:pitch).permit Pitch::PARAMS
  end

  def load_pitch
    @pitch = Pitch.find_by id: params[:id]
    return if @pitch

    flash[:danger] = t "flash.not_found"
    redirect_back fallback_to: root_path
  end

  def load_pitches_on_the_same_area
    @fields = Pitch.on_the_same_area(@pitch).includes :province, :district
  end

  def load_timesheets
    @timesheets = Timesheet.in_pitch(@pitch.id).includes(:sub_pitch).group_by(&:sub_pitch_name)
  end

  def load_for_booking
    @booking = Booking.new
    @bookings = Booking.booking_in_date.group_by(&:timesheet_id)
    @current_user_team = current_user.teams.pluck :name, :id if user_signed_in?
  end
end
