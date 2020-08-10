namespace :export do
  desc 'Export Tournamenet Matches to fixture'
  task uefa_2021_tournament_matches_to_fixture: :environment do
    raise 'this may only run in :development' unless Rails.env.development?

    puts "Deleting all Tournament Matches"
    TournamentMatch.delete_all

    Rake::Task['import:uefa_2021'].invoke

    fixture_path = Rails.root.join('test/fixtures/tournament_matches.yml')
    puts "\nCreating #{fixture_path}"

    service = TournamentMatchesToFixtureExporter.new(TournamentMatch.chronologically)
    fixture_path.write(service.to_fixture_yaml)
  end
end
