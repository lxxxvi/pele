module Types
  class VenueType < BaseObject
    field :city, String, null: false
    field :stadium, String, null: false
    field :country_time_zone_identifier, String, null: false
  end
end
