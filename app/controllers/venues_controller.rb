class VenuesController < ApplicationController
  def index
    @venues = Venue.alphabetically
  end
end
