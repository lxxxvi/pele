require 'test_helper'

class Mutations::SignInUserTest < ActiveSupport::TestCase
  test 'sign in user' do
    result = perform(
      user_params: {
        email: 'maradona@maradona.com',
        password: 'abc'
      }
    )

    assert result[:token].present?
    assert result[:errors].none?
  end

  test 'sign in user, invalid credentials' do
    result = perform(
      user_params: {
        email: 'maradona@maradona.com',
        password: 'wrong'
      }
    )

    assert result[:errors].any?
    assert_equal ['Invalid username and/or password'], result[:errors]
  end

  test 'sign in user, invalid email' do
    result = perform(
      user_params: {
        email: 'does-not-exist@domain.tld',
        password: 'whatever'
      }
    )

    assert result[:errors].any?
    assert_equal ['Invalid username and/or password'], result[:errors]
  end

  private

  def perform(args = {})
    Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve(**args)
  end
end
