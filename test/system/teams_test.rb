require "application_system_test_case"

class TeamsTest < ApplicationSystemTestCase
  test 'visit teams index' do
    visit root_path
    click_on 'Teams'
    assert_selector 'h1', text: 'Teams'
  end

  test 'index displays teams in alphabetic order' do
    visit teams_path

    within 'ul.teams' do
      assert_selector 'li', count: 3
      trigrams = find_all('li .trigram').map(&:text)
      assert_equal %w[CUB PER VIN], trigrams
    end
  end

  test 'creates a team' do
    visit root_path
    click_on 'Teams'
    click_on 'Add team'

    assert_selector 'h1', text: 'Add team'
    assert_link 'Cancel', href: '/teams'

    within 'form' do
      fill_in 'Trigram', with: 'FIJ'
      click_on 'Add team'
    end

    assert_selector '.flash.notice', text: 'Team added.'
    assert_selector 'h1', text: 'Teams'
  end
end
