# require 'active_support/concern'

module Venues
  VenueStruct = Struct.new(:city, :stadium, :country_time_zone_identifier)

  VENUES = {
    amsterdam: VenueStruct.new(:amsterdam, 'Johan Cruyff Arena', 'Europe/Amsterdam'),
    baku: VenueStruct.new(:baku, 'Olympic Stadium', 'Asia/Baku'),
    bilbao: VenueStruct.new(:bilbao, 'San Mamés', 'Europe/Madrid'),
    bucharest: VenueStruct.new(:bucharest, 'Arena Națională', 'Europe/Bucharest'),
    budapest: VenueStruct.new(:budapest, 'Puskás Aréna', 'Europe/Budapest'),
    copenhagen: VenueStruct.new(:copenhagen, 'Parken Stadium', 'Europe/Copenhagen'),
    dublin: VenueStruct.new(:dublin, 'Aviva Stadium', 'Europe/Dublin'),
    glasgow: VenueStruct.new(:glasgow, 'Hampden Park', 'Europe/London'),
    london: VenueStruct.new(:london, 'Wembley Stadium', 'Europe/London'),
    munich: VenueStruct.new(:munich, 'Allianz Arena', 'Europe/Berlin'),
    rome: VenueStruct.new(:rome, 'Stadio Olimpico', 'Europe/Rome'),
    saint_petersburg: VenueStruct.new(:saint_petersburg, 'Krestovsky Stadium', 'Europe/Moscow')
  }.freeze

  def venue
    @venue ||= VENUES[venue_key.to_sym]
  end
end
