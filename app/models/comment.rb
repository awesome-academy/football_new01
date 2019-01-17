class Comment < ApplicationRecord
  acts_as_paranoid
  belongs_to :new
  belongs_to :user

  delegate :name, to: :user, prefix: true

  scope :newest, ->{order created_at: :desc}
end
