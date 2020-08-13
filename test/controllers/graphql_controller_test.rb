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

  test '#graphql, mutation signUpUser' do
    query_string = <<~GRAPHQL
      mutation signUpUser($input: SignUpUserInput!) {
        signUpUser(input: $input) {
          user {
            email
          }
          errors {
            attribute
            message
          }
        }
      }
    GRAPHQL

    variables = { input: { userParams: { email: "zidane@zidane.com", password: "il-a-frappe"} } }

    assert_difference -> { User.count }, +1 do
      post graphql_path, params: { query: query_string, variables: variables }
    end

    json_response = JSON.parse(response.body)
    data = json_response['data']

    assert_equal 'zidane@zidane.com', data['signUpUser']['user']['email']
    assert_equal 0, data['signUpUser']['errors'].size
  end

  test '#graphql, mutation signInUser' do
    query_string = <<~GRAPHQL
      mutation signInUser($input: SignInUserInput!) {
        signInUser(input: $input) {
          user {
            email
          }
          token
        }
      }
    GRAPHQL

    variables = { input: { userParams: { email: 'maradona@maradona.com', password: 'abc' } } }

    post graphql_path, params: { query: query_string, variables: variables }

    json_response = JSON.parse(response.body)
    data = json_response['data']

    assert_equal 'maradona@maradona.com', data['signInUser']['user']['email']
    assert data['signInUser']['user'].present?
  end
end
