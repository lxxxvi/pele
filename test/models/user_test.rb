require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#save' do
    user = User.new(email: 'foo@bar.com', password: 'abc')
    assert_difference -> { User.count }, +1 do
      assert user.save
    end
  end

  test 'validates presence' do
    user = User.new

    assert_not user.save

    user.errors.to_a.tap do |errors|
      assert_includes errors, "Email can't be blank"
      assert_includes errors, "Password can't be blank"
    end
  end

  test 'validates uniqueness' do
    user = User.new(email: 'maradona@maradona.com', password: 'abc')

    assert_not user.valid?

    assert_includes user.errors.to_a, "Email has already been taken"
  end
end
