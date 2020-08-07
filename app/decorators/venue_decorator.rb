class VenueDecorator < BaseDecorator
  def display_name_with_city
    "#{name}, #{Venue.human_enum_name(:city, city)}"
  end

  def self.venues_dropdown
    Venue.alphabetically.map do |venue|
      [ venue.decorate.display_name_with_city, venue.id]
    end
  end
end
