class TournamentMatch < ApplicationRecord
  include Venues

  validates :uefa_match_id, :kickoff_at, :tournament_stage, presence: true
  validates :venue_key, inclusion: { in: Venues::VENUES.keys.map(&:to_s) }
  validates :home_team, :guest_team, inclusion: { in: Teams::TRIGRAMS }
  validates :home_team_score, :guest_team_score, numericality: { only_integers: true, greater_than_or_equal_to: 0 }, allow_nil: true

  enum tournament_stage: {
          group_match_1: 'group_match_1',
          group_match_2: 'group_match_2',
          group_match_3: 'group_match_3',
          round_of_16: 'round_of_16',
          quarter_finals: 'quarter_finals',
          semi_finals: 'semi_finals',
          final: 'final'
       }

  scope :chronologically, -> { order(kickoff_at: :asc) }
end
