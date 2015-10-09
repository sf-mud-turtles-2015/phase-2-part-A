class User < ActiveRecord::Base
  has_many :bids
  has_many :items, through: :bids

  validates :email, uniqueness: true
  validates :password, format: { with: /.{6,}/}
end
