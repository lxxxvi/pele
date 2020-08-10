class Admin::TournamentMatchesController < Admin::BaseController
  before_action :set_tournament_match, only: %i[edit update]

  def index
    @tournament_matches = TournamentMatch.chronologically
  end

  def edit; end

  def update
    if @tournament_match.update(tournament_match_params)
      flash[:notice] = I18n.t('.update_success')
      redirect_to admin_tournament_matches_path
    else
      render :edit, alert: I18n.t('.update_failed')
    end
  end

  private

  def set_tournament_match
    @tournament_match = TournamentMatch.find(params[:id])
  end

  def tournament_match_params
    params.require(:tournament_match).permit(:uefa_match_id, :kickoff_at, :venue_key, :home_team, :home_team_score, :guest_team, :guest_team_score, :tournament_stage)
  end
end
