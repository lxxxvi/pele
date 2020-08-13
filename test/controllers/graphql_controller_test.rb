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

  test '#graphql, mutation createUser' do
    query_string = <<~GRAPHQL
      mutation createUser($input: CreateUserInput!) {
        createUser(input: $input) {
          email
          errors {
            attribute
            message
          }
        }
      }
    GRAPHQL

    variables = { input: { userParams: { email: "zidane@zidane.com", password: "il-a-frappe"} } }

    assert_difference -> { User.count } do
      post graphql_path, params: { query: query_string, variables: variables }
    end

    json_response = JSON.parse(response.body)
    data = json_response['data']

    assert_equal 'zidane@zidane.com', data['createUser']['email']
  end
end
