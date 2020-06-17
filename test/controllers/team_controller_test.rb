require 'test_helper'

class TeamControllerTest < ActionDispatch::IntegrationTest
  test 'get index' do
    get teams_path
    assert_response :success
  end

  test 'get new' do
    get new_team_path
    assert_response :success
  end

  test 'post create' do
    assert_difference -> { Team.count }, +1 do
      post teams_path, params: { team: { trigram: 'FIJ' } }
    end

    follow_redirect!
    assert_response :success
  end
end
