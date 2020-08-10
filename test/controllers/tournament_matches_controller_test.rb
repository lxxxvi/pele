require 'test_helper'

class TournamentMatchesControllerTest < ActionDispatch::IntegrationTest
  test 'get index' do
    get tournament_matches_path
    assert_response :success
  end

  test 'get edit' do
    get edit_tournament_match_path(tournament_matches(:uefa_match_1))
    assert_response :success
  end

  test 'put update' do
    tournament_match = tournament_matches(:uefa_match_1)

    assert_changes -> { tournament_match.updated_at } do
      put tournament_match_path(tournament_match),
          params: {
            tournament_match: {
              uefa_match_id: '99',
              'kickoff_at(1i)': '2021',
              'kickoff_at(2i)': '7',
              'kickoff_at(3i)': '31',
              'kickoff_at(4i)': '23',
              'kickoff_at(5i)': '59',
              venue_key: 'baku',
              home_team: 'ENG',
              guest_team: 'POR',
              home_team_score: '9',
              guest_team_score: '8',
            }
          }
      tournament_match.reload
    end


    assert_equal '99', tournament_match.uefa_match_id
    assert_equal '2021-07-31 23:59:00 UTC', tournament_match.kickoff_at.to_s
    assert_equal 'baku', tournament_match.venue_key
    assert_equal 'ENG', tournament_match.home_team
    assert_equal 'POR', tournament_match.guest_team
    assert_equal 9, tournament_match.home_team_score
    assert_equal 8, tournament_match.guest_team_score

    assert_redirected_to tournament_matches_path
    follow_redirect!
    assert_response :success
  end
end
