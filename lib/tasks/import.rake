namespace :import do
  desc 'Load Tournament Matches'
  task uefa_2021: :environment do
    tournament_matches_pathname = Rails.root.join('data/uefa_2021/tournament_matches.csv')
    TournamentMatchesImporter.new(tournament_matches_pathname).import_all!
  end
end
