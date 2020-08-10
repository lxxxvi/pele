require 'test_helper'

class GraphqlControllerTest < ActionDispatch::IntegrationTest
  test '#graphql, tournamentMatches' do
    query_string = "{ tournamentMatches { uefaMatchId venue { city stadium } } }"
    post graphql_path, params: { query: query_string }

    json_response = JSON.parse(response.body)
    data = json_response['data']

    assert_equal 51, data['tournamentMatches'].size
    assert_equal '1', data['tournamentMatches'].first['uefaMatchId']
    assert_equal '51', data['tournamentMatches'].last['uefaMatchId']

    assert_equal 'rome', data['tournamentMatches'].first['venue']['city']
    assert_equal 'Stadio Olimpico', data['tournamentMatches'].first['venue']['stadium']
  end
end
