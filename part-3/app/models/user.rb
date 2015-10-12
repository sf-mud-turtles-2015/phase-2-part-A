class User < ActiveRecord::Base

  has_many :listed_items, class_name: "Item"
  has_many :bidded_items, through: :bids, source: :item
  has_many :bids

  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }

end
