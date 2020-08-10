require 'test_helper'

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  teardown do
    sign_out_admin
  end

  test 'get new' do
    get new_admin_session_path
    assert_response :success
  end

  test 'post create' do
    sign_out_admin # creates session
    assert_changes -> { session[:admin_signed_in] }, to: true do
      sign_in_admin
    end
  end

  test 'post create, invalid password' do
    sign_out_admin

    assert_no_changes -> { session[:admin_signed_in] } do
      post admin_sessions_path, params: { admin_password: 'wrong' }
    end
  end

  test 'get destroy' do
    sign_in_admin

    assert_changes -> { session[:admin_signed_in] }, to: nil do
      sign_out_admin
    end
  end
end
