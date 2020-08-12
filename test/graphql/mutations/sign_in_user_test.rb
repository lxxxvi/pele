require 'test_helper'

class Mutations::SignInUserTest < ActiveSupport::TestCase
  test 'success' do
    user = users(:maradona)

    result = perform(
      user_credentials: {
        email: 'maradona@maradona.com',
        password: 'abc'
      }
    )

    assert result[:token].present?
    byebug
  end

  private

  def perform(args = {})
    Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve(args)
  end
end
