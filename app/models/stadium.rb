class Stadium < ApplicationRecord
  acts_as_paranoid
  has_many :teams, dependent: :destroy
end
