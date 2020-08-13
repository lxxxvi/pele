require 'test_helper'

class Mutations::SignUpUserTest < ActiveSupport::TestCase
  test 'create a user' do
    result = perform(
      user_params: {
        email: 'foo@bar.com',
        password: 'abc'
      }
    )

    assert_equal 0, result[:errors].size
    assert_equal 'foo@bar.com', result[:user][:email]
  end

  test 'sign up user, validates presence' do
    result = perform(
      user_params: {
        email: '',
        password: ''
      }
    )

    assert_equal 3, result[:errors].size

    assert_includes error_messages_for_attribute(result[:errors], :email), "can't be blank"
    assert_includes error_messages_for_attribute(result[:errors], :password), "can't be blank"
  end

  test 'sign up user, validates uniqueness' do
    result = perform(
      user_params: {
        email: 'maradona@maradona.com',
        password: 'diego4ever'
      }
    )

    assert_equal 1, result[:errors].size
    assert_includes error_messages_for_attribute(result[:errors], :email), "has already been taken"
  end

  private

  def perform(user: nil, **args)
    Mutations::SignUpUser.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  def error_messages_for_attribute(errors, attribute)
    errors.each_with_object([]) do |error, result|
      result << error[:message] if error[:attribute] == attribute.to_s
    end
  end
end
