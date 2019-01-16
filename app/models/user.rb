class User < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  USER_PARAMS = %i(email name encrypted_password).freeze
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save{email.downcase!}

  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :news
  has_many :score_bets, dependent: :destroy

  validates :name,  presence: true,
    length: {maximum: Settings.users.name_length}
  validates :email, presence: true,
    length: {maximum: Settings.users.email_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.users.password_length}, allow_nil: true

  def reduce_money price
    new_money = money.to_f - price.to_f
    update_attributes money: new_money
  end

  def get_money_back price
    old_money = money.to_f + price.to_f
    update_attributes money: old_money
  end
end
