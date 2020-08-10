require 'csv'

class TournamentMatchesImporter
  def initialize(tournament_matches_pathname)
    @tournament_matches_pathname = tournament_matches_pathname
  end

  def import_all!
    CSV.table(@tournament_matches_pathname).each do |csv_row|
      puts_info(csv_row)
      import(csv_row)
    end
  end

  private

  def puts_info(csv_row)
    puts "Importing #{csv_row[:uefa_match_id].to_s.rjust(2, ' ')}: #{csv_row[:home_team]} vs #{csv_row[:guest_team]} (#{csv_row[:tournament_stage]}, #{csv_row[:venue]})..."
  end

  def import(csv_row)
    tournament_match = TournamentMatch.find_or_initialize_by(uefa_match_id: csv_row[:uefa_match_id])

    if tournament_match.new_record?
      tournament_match.assign_attributes({
        home_team: csv_row[:home_team],
        guest_team: csv_row[:guest_team],
        tournament_stage: to_enum(csv_row[:tournament_stage]),
        kickoff_at: csv_row[:kickoff_at],
        venue_key: to_enum(csv_row[:venue])
      })

      tournament_match.save!
    end
  end

  def to_enum(value)
    value.tr(' ', '_').downcase.to_sym
  end
end
