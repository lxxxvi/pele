require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'validates presences' do
    team = Team.new

    assert_not team.valid?
    assert_includes team.errors.full_messages, "Trigram can't be blank"
  end

  test 'valdiates uniqueness' do
    team = Team.new(trigram: 'per')

    assert_not team.valid?
    assert_equal 'PER', team.trigram
    assert_includes team.errors.full_messages, 'Trigram has already been taken'
  end

  test 'validates trigram length, > 3' do
    team = Team.new(trigram: 'FIJI')
    assert_not team.valid?
    assert_includes team.errors.full_messages, 'Trigram must contain exactly 3 letters'
  end

  test 'validates trigram length, < 3' do
    team = Team.new(trigram: 'FI')
    assert_not team.valid?
    assert_includes team.errors.full_messages, 'Trigram must contain exactly 3 letters'
  end

  test '#save!' do
    assert Team.new(trigram: 'FIJ').save!
  end
end
