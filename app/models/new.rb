class New < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_many :comments, dependent: :destroy

  delegate :name, to: :user, prefix: true
  scope :newest, ->{order created_at: :asc}
end
