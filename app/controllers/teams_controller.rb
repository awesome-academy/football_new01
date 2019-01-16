class TeamsController < ApplicationController
  before_action :load_teams, only: :index

  def index; end

  private

  def load_teams
    return if params[:q].present?
    @teams = Team.newest
                 .paginate page: params[:page], per_page: Settings.teams.page
  end
end
