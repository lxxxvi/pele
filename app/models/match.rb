class Match < ApplicationRecord
  belongs_to :venue
  belongs_to :home_team, class_name: 'Team', optional: true
  belongs_to :guest_team, class_name: 'Team', optional: true

  validates :uefa_match_id, :kickoff_at, :tournament_stage, presence: true
  validates :home_team_score, :guest_team_score, numericality: { only_integers: true, greater_than_or_equal_to: 0 }, allow_nil: true

  enum tournament_stage: %i[group_match_1 group_match_2 group_match_3 round_of_16 quarter_finals semi_finals final]

  scope :chronologically, -> { order(kickoff_at: :asc) }
end
