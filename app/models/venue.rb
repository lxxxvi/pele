class Venue < ApplicationRecord
  validates :name, :city, :country_time_zone_identifier, presence: true
  validates :city, uniqueness: true

  scope :alphabetically, -> { order(name: :asc) }

  enum city: {
          amsterdam: 'amsterdam',
          baku: 'baku',
          bilbao: 'bilbao',
          bucharest: 'bucharest',
          budapest: 'budapest',
          copenhagen: 'copenhagen',
          dublin: 'dublin',
          glasgow: 'glasgow',
          london: 'london',
          munich: 'munich',
          rome: 'rome',
          saint_petersburg: 'saint_petersburg'
       }
end
