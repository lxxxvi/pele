require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  test 'create a user' do
    user = perform(
      user_credentials: {
        email: 'foo@bar.com',
        password: 'abc'
      }
    )

    assert user.persisted?
    assert_equal 'foo@bar.com', user.email
  end

  private

  def perform(user: nil, **args)
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(**args)
  end
end
