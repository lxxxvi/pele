class Venue < ApplicationRecord
  validates :name, :city, :country_time_zone_identifier, presence: true
  validates :city, uniqueness: true

  scope :alphabetically, -> { order(name: :asc) }
end
