class User < ActiveRecord::Base
  has_many :bids
  has_many :items, through: :bids

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: {minimum: 6}
end
