class TeamsController < ApplicationController
  def index
    @teams = Team.alphabetically
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      flash[:notice] = 'Team added.'
      redirect_to teams_path
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:trigram)
  end
end
