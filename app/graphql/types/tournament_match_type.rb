module Types
  class TournamentMatchType < BaseObject
    field :uefa_match_id, String, null: false
    field :venue, Types::VenueType, null: false
    field :venue_key, String, null: false
    field :kickoff_at, GraphQL::Types::ISO8601DateTime, null: false
    field :tournament_stage, String, null: false
    field :home_team, String, null: false
    field :guest_team, String, null: false
    field :home_team_score, Integer, null: true
    field :guest_team_score, Integer, null: true
  end
end
