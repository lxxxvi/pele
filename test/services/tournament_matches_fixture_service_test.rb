require 'test_helper'

class TournamentMatchesFixtureServiceTest < ActiveSupport::TestCase
  test '#to_fixture_yaml' do
    tournament_matches = TournamentMatch.chronologically.first(2)

    assert_equal expected_yaml,
                 TournamentMatchesFixtureService.new(tournament_matches).to_fixture_yaml
  end

  private

  def expected_yaml
    <<~YML
      ---

      uefa_match_1:
        uefa_match_id: '1'
        venue_key: rome
        kickoff_at: 2021-06-11 19:00:00 UTC
        tournament_stage: group_match_1
        home_team: TUR
        guest_team: ITA
        home_team_score:
        guest_team_score:

      uefa_match_2:
        uefa_match_id: '2'
        venue_key: baku
        kickoff_at: 2021-06-12 13:00:00 UTC
        tournament_stage: group_match_1
        home_team: WAL
        guest_team: SUI
        home_team_score:
        guest_team_score:
    YML
  end
end
