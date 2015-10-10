class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_many :items
  has_many :bids
  has_many :potential_items, through: :bids, source: :item
end
