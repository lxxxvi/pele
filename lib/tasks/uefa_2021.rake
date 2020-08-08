namespace :uefa_2021 do
  desc 'Load Tournament Matches'
  task load_tournament_matches: :environment do
    require 'csv'
    tournament_matches_pathname = Rails.root.join('data/uefa_2021/tournament_matches.csv')

    puts "\nLoading tournament matches"
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

    # puts "Deleting all Tournament Matches"
    # TournamentMatch.delete_all

    # Rake::Task['uefa_2021:load_tournament_matches'].invoke

    fixture_path = Rails.root.join('test/fixtures/tournament_matches.yml')
    puts "Creating #{fixture_path}"

    tournament_matches_as_fixture = TournamentMatch.find_each.each_with_object({}) do |tournament_match, result|
      result["uefa_match_#{tournament_match.uefa_match_id}"] = {
        'uefa_match_id' => tournament_match.uefa_match_id,
        'venue_key' => tournament_match.venue_key,
        'kickoff_at' => tournament_match.kickoff_at.to_s,
        'tournament_stage' => tournament_match.tournament_stage,
        'home_team' => tournament_match.home_team,
        'guest_team' => tournament_match.guest_team,
        'home_team_score' => tournament_match.home_team_score,
        'guest_team_score' => tournament_match.guest_team_score
      }
    end

    yaml_content = tournament_matches_as_fixture.to_yaml.gsub(/^([a-zA-Z]+)/, "\n\\1")

    fixture_path.write(yaml_content)
  end
end
