namespace :uefa_2021 do
  desc 'Load Tournament Matches'
  task load_tournament_matches: :environment do
    require 'csv'
    tournament_matches_pathname = Rails.root.join('data/uefa_2021/tournament_matches.csv')

    CSV.table(tournament_matches_pathname).each do |row|
      puts "  * #{row[:uefa_match_id].to_s.rjust(2, ' ')}: #{row[:home_team]} vs #{row[:guest_team]} (#{row[:tournament_stage]}, #{row[:venue]})"

      TournamentMatch.find_or_initialize_by(uefa_match_id: row[:uefa_match_id]) do |tournament_match|
        tournament_match.home_team = row[:home_team]
        tournament_match.guest_team = row[:guest_team]
        tournament_match.tournament_stage = row[:tournament_stage].tr(' ', '_').downcase.to_sym
        tournament_match.kickoff_at = row[:kickoff_at]
        tournament_match.venue_key = row[:venue].tr(' ', '_').downcase.to_sym
        tournament_match.save!
      end
    end
  end

  desc 'create tournament_matches.yml fixture'
  task create_tournament_matches_fixture: :environment do
    raise 'this may only run in :development' unless Rails.env.development?

    puts "Deleting all Tournament Matches"
    TournamentMatch.delete_all

    Rake::Task['uefa_2021:load_tournament_matches'].invoke

    fixture_path = Rails.root.join('test/fixtures/tournament_matches.yml')
    puts "\nCreating #{fixture_path}"

    service = TournamentMatchesFixtureService.new(TournamentMatch.chronologically)
    fixture_path.write(service.to_fixture_yaml)
  end
end
