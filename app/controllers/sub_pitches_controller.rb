class SubPitchesController < ApplicationController
  before_action :authenticate_user!, :load_pitch
  before_action :load_sub_pitch_types, except: %i(update destroy)
  before_action :init_sub_pitch, :init_timesheet, only: %i(index create)
  before_action :load_sub_pitch, only: %i(edit update destroy)

  def index
    @sub_pitches = SubPitch.correct_pitch(@pitch.id).includes :pitch
  end

  def edit; end

  def create
    @sub_pitch.assign_attributes sub_pitch_params.merge pitch_id: @pitch.id
    respond_to do |format|
      @sub_pitch.save
      format.js
    end
  end

  def update
    if @sub_pitch.update sub_pitch_params
      flash[:success] = t "flash.update_success"
      redirect_to pitch_sub_pitches_path
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      @sub_pitch.destroy
      format.js
    end
  end

  private

  def sub_pitch_params
    params.require(:sub_pitch).permit SubPitch::PARAMS
  end

  def load_sub_pitch
    @sub_pitch = SubPitch.find_by id: params[:id]
    return if @sub_pitch

    flash[:danger] = t "flash.not_found"
    redirect_to root_path
  end

  def load_pitch
    @pitch = Pitch.find_by id: params[:pitch_id]
    return if @pitch

    flash[:danger] = t "flash.not_found"
    redirect_to root_path
  end

  def init_sub_pitch
    @sub_pitch = SubPitch.new
  end

  def load_sub_pitch_types
    @sub_pitch_types = SubPitchType.order(:id).pluck :name, :id
  end

  def init_timesheet
    @timesheet = Timesheet.new
  end
end
