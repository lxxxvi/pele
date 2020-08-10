class TournamentMatchDecorator < BaseDecorator
  def display_stadium_with_city
    self.class.build_display_stadium_with_city(venue.stadium, venue_key)
  end

  def self.tournament_stages_dropdown
    TournamentMatch.tournament_stages.map do |key, value|
      [key, TournamentMatch.human_enum_name(:tournament_stage, key)]
    end
  end

  def self.teams_dropdown
    Teams::TRIGRAMS.without('N/A').sort.map do |trigram|
      [trigram, trigram]
    end
  end

  def self.venues_cities_dropdown
    Venues::VENUES.map do |venue_key, venue|
      [venue_key, build_display_stadium_with_city(venue.stadium, venue_key)]
    end
  end

  private

  def self.build_display_stadium_with_city(stadium, venue_key)
    "#{stadium}, #{I18n.t("venues.#{venue_key}")}"
  end
end
