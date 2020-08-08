require 'test_helper'

class TournamentMatchDecoratorTest < ActiveSupport::TestCase
  setup do
    @tournament_match_1 = tournament_matches(:uefa_match_1)
  end

  test '#display_stadium_with_city' do
    assert_equal 'Stadio Olimpico, Rome', @tournament_match_1.decorate.display_stadium_with_city
  end

  test '.tournament_stages_dropdown' do
    assert_dropdown TournamentMatchDecorator.tournament_stages_dropdown,
                    7,
                    ["group_match_1", "Group match 1"],
                    ["final", 'Final']
  end

  test '.teams_dropdown' do
    assert_dropdown TournamentMatchDecorator.teams_dropdown,
                    20,
                    ['AUT', 'AUT'],
                    ['WAL', 'WAL']
  end

  test '.venues_cities_dropdown' do
    assert_dropdown TournamentMatchDecorator.venues_cities_dropdown,
                    12,
                    [:amsterdam, 'Johan Cruyff Arena, Amsterdam'],
                    [:saint_petersburg, 'Krestovsky Stadium, Saint Petersburg']
  end

  private

  def assert_dropdown(dropdown, total_elements, first_element, last_element)
    assert_equal total_elements, dropdown.size
    assert_equal first_element, dropdown.first
    assert_equal last_element, dropdown.last
  end
end
