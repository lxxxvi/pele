require 'test_helper'

class TournamentMatchTest < ActiveSupport::TestCase
  setup do
    @tournament_match_1 = tournament_matches(:uefa_match_1)
  end

  test 'not #valid?' do
    tournament_match = TournamentMatch.new

    assert_not tournament_match.valid?

    tournament_match.errors.to_a.tap do |errors|
      assert_includes errors, "UEFA match ID can't be blank"
      assert_includes errors, "Kickoff time can't be blank"
      assert_includes errors, "Tournament stage can't be blank"
      assert_includes errors, 'Venue key is not included in the list'
      assert_includes errors, 'Home team is not included in the list'
      assert_includes errors, 'Guest team is not included in the list'
    end
  end

  test '#save' do
    tournament_match = TournamentMatch.new(
      uefa_match_id: '99',
      venue_key: :rome,
      kickoff_at: Time.zone.now,
      tournament_stage: :group_match_1,
      home_team: 'ITA',
      guest_team: 'WAL'
    )

    assert tournament_match.save
  end

  test 'validates uniqueness of uefa_match_id' do
    tournament_match = @tournament_match_1.dup

    assert_not tournament_match.valid?

    tournament_match.errors.to_a.tap do |errors|
      assert_includes errors, "UEFA match ID has already been taken"
    end
  end

  test '#venue' do
    assert_equal :rome, @tournament_match_1.venue.city
    assert_equal 'Stadio Olimpico', @tournament_match_1.venue.stadium
    assert_equal 'Europe/Rome', @tournament_match_1.venue.country_time_zone_identifier
  end
end
