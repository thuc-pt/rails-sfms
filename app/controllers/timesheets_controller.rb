class TimesheetsController < ApplicationController
  before_action :load_timesheet, only: %i(edit update destroy)

  def edit; end

  def create
    @timesheet = Timesheet.new timesheet_params
    respond_to do |format|
      @timesheet.save
      @sub_pitch_id = params[:timesheet][:sub_pitch_id].to_i
      format.js
    end
  end

  def update
    if @timesheet.update timesheet_params
      flash[:success] = t "flash.update_success"
      redirect_back fallback_location: root_path
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      @timesheet.destroy
      format.js
    end
  end

  private
  def timesheet_params
    params.require(:timesheet).permit Timesheet::PARAMS
  end

  def load_timesheet
    @timesheet = Timesheet.find_by id: params[:id]
    return if @timesheet

    flash[:danger] = t "flash.not_found"
    redirect_to root_path
  end
end
