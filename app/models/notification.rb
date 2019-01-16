class Notification < ApplicationRecord
  acts_as_paranoid
  belongs_to :user, optional: true
  belongs_to :score_bet, optional: true
end
