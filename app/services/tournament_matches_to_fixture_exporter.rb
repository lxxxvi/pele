class TournamentMatchesToFixtureExporter
  def initialize(tournament_matches)
    @tournament_matches = tournament_matches
  end

  def to_fixture_yaml
    sanitize_yaml(tournament_matches_as_fixture.to_yaml)
  end

  private

  def sanitize_yaml(yaml)
    yaml.gsub(/^([a-zA-Z]+)/, "\n\\1")
  end

  def tournament_matches_as_fixture
    @tournament_matches.each_with_object({}) do |tournament_match, result|
      result["uefa_match_#{tournament_match.uefa_match_id}"] = to_fixure_hash(tournament_match)
    end
  end

  def to_fixure_hash(tournament_match)
    {
      'uefa_match_id' => tournament_match.uefa_match_id,
      'venue_key' => tournament_match.venue_key,
      'kickoff_at' => tournament_match.kickoff_at.to_s,
      'tournament_stage' => tournament_match.tournament_stage,
      'home_team' => tournament_match.home_team,
      'guest_team' => tournament_match.guest_team,
      'home_team_score' => tournament_match.home_team_score,
      'guest_team_score' => tournament_match.guest_team_score
    }
  end
end
