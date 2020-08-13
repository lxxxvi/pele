require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  test 'create a user' do
    result = perform(
      user_params: {
        email: 'foo@bar.com',
        password: 'abc'
      }
    )

    assert_equal 0, result[:errors].size
    assert_equal 'foo@bar.com', result[:email]
  end

  private

  def perform(user: nil, **args)
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(**args)
  end
end
