class Bid < ActiveRecord::Base
  belongs_to :bidder
  belongs_to :item
end
