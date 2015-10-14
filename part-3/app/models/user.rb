class User < ActiveRecord::Base
  has_many :bids
  has_many :items

  has_many :bid_on_items, through: :bids, source: :item, class_name: "Item" 
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, :length => {:within => 6..90}
end
