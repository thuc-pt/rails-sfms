class MatchesController < ApplicationController
  before_action :load_provinces, :load_list_levels, :load_results, only: %i(index list_matches_by_params)
  before_action :load_teams, :load_pitches, :load_levels, only: %i(new create edit update)

  def index; end

  def list_matches_by_params; end

  def new
    @match = Match.new
  end

  def edit; end

  def create
    @match = Match.new(match_params.merge!(user_id: current_user.id,
                                           captain_name: Team.find_by(id: params[:match][:team_id])&.user_name))
    if @match.save
      flash[:success] = t "flash.create_success"
      redirect_to matches_path
    else
      render :new
    end
  end

  private

  def load_pitches
    @pitches = Pitch.pluck :name, :id
  end

  def load_teams
    @teams = Team.pluck :name, :id
  end

  def load_levels
    @levels = Level.pluck :name, :id
  end

  def match_params
    params.require(:match).permit Match::PARAMS
  end

  def load_provinces
    @list_provinces = Province.includes(:matches)
                              .has_match.map{|province| [province.name, province.id, province.matches.size]}
                              .sort{|a, b| b[2] <=> a[2]}
  end

  def load_list_levels
    @levels = Level.includes(:matches).has_match.map{|level| [level.name, level.id, level.matches.size]}
                   .sort{|a, b| b[2] <=> a[2]}
  end

  def load_results
    province = params[:element].present? ? params[:element].delete("#").to_i : @list_provinces.first&.second
    level = params[:level_id].present? ? params[:level_id].split(",") : []
    @matches = Match.in_province(province).in_level(level).order(id: :desc)
                    .includes(:pitch, :province, :district, :level, :team).ransack params[:q]
    @list_matches = @matches.result
  end
end
