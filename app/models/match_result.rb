class MatchResult < ApplicationRecord
  acts_as_paranoid
  belongs_to :match
  scope :newest, ->{order created_at: :desc}

  validates :score1, numericality: true
  validates :score2, numericality: true
end
