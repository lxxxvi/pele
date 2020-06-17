class Team < ApplicationRecord
  validates :trigram, presence: true
  validates :trigram, uniqueness: true
  validate :validate_trigram_length

  before_validation :upcase_trigram

  scope :alphabetically, -> { order(trigram: :asc) }

  private

  def upcase_trigram
    self.trigram&.upcase!
  end

  def validate_trigram_length
    return if String(trigram).size == 3

    errors.add(:trigram, 'must contain exactly 3 letters')
  end
end
