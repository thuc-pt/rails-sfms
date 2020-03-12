class HomeController < ApplicationController
  before_action :load_provinces, only: :index
  before_action :handle_params, :load_districts, :load_pitches

  def index; end

  def list_pitches_by_province; end

  def list_pitches_by_district; end

  private

  def load_pitches
    @pitches = Pitch.is_active.in_province(@province_id).in_district(@district_id).ransack params[:q]
    @list_pitches = @pitches.result.includes(:user, :province, :district, sub_pitches: :timesheets).page params[:page]
  end

  def load_provinces
    provinces = Province.has_pitches.includes :pitches
    provinces = provinces.map{|province| [province.name, province.id, province.pitches.size]}
    @list_provinces = provinces.sort{|a, b| b[2] <=> a[2]}
  end

  def load_districts
    districts = District.in_province(@province_id).has_pitches.includes :pitches
    districts = districts.map{|district| [district.name, district.id, district.pitches.size]}
    @list_districts = districts.sort{|a, b| b[2] <=> a[2]}
  end

  def handle_params
    @province_id = params[:element].present? ? params[:element].delete("#").to_i : 0
    @district_id = params[:district].present? ? params[:district].delete("").split(",") : nil
  end
end
