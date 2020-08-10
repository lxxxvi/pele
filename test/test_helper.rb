ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def sign_in_admin
    post admin_sessions_path, params: { admin_password: 'admin' }
    assert_redirected_to admin_root_path
    follow_redirect!
    assert_redirected_to admin_tournament_matches_path
    follow_redirect!
    assert_response :success
  end

  def sign_out_admin
    get admin_sign_out_path
    assert_redirected_to new_admin_session_path
    follow_redirect!
    assert_response :success
  end
end
