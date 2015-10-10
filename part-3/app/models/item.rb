class Item < ActiveRecord::Base
  belongs_to :user
  has_many :bidders, through: :bids, source: :bidder
  has_many :bids
end
