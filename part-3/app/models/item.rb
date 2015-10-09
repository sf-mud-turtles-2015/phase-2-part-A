class Item < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", foreign_key: :owner_id
  has_many :bidders, :class_name => "User", foreign_key: :bidder_id, through: :bids

  has_many :bids
end
