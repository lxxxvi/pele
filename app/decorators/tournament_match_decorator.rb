class TournamentMatchDecorator < BaseDecorator
  def display_venue_name_with_city
    venue.decorate.display_name_with_city
  end

  def self.tournament_stages_dropdown
    TournamentMatch.tournament_stages.map do |key, value|
      [TournamentMatch.human_enum_name(:tournament_stage, key), value]
    end
  end

  def self.teams_dropdown
    Teams::TRIGRAMS.without('N/A').sort.map do |trigram|
      [trigram, trigram]
    end
  end
end
