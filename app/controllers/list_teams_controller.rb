class ListTeamsController < ApplicationController
  before_action :load_provinces, :load_levels, :load_results

  def index; end

  def list_teams_by_params; end

  private

  def load_provinces
    @list_provinces = Province.includes(:teams)
                              .has_team.map{|province| [province.name, province.id, province.teams.size]}
                              .sort{|a, b| b[2] <=> a[2]}
  end

  def load_levels
    @levels = Level.includes(:teams).has_team.map{|level| [level.name, level.id, level.teams.size]}
                   .sort{|a, b| b[2] <=> a[2]}
  end

  def load_results
    province = params[:element].present? ? params[:element].delete("#").to_i : @list_provinces.first&.second
    @teams = Team.in_province(province).in_level(params[:level_id].present? ? params[:level_id].split(",") : [])
                 .includes(:pitch, :province, :district, :user).ransack params[:q]
    @list_teams = @teams.result
  end
end
