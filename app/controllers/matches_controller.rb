class MatchesController < ApplicationController
  def index
    @matches = Match.chronologically.includes(:venue, :home_team, :guest_team)
                                    .left_outer_joins(:venue, :home_team, :guest_team)
  end

  def edit
    @match = Match.find(params[:id])
  end
end
