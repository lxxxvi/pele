module Types
  class QueryType < Types::BaseObject
    field :tournament_matches, [TournamentMatchType], null: true

    def tournament_matches
      TournamentMatch.chronologically
    end
  end
end
