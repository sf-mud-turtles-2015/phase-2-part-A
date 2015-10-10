class Bid < ActiveRecord::Base
  belongs_to :item
  belongs_to :bidder, class_name: "User", foreign_key: :user_id
  # belongs_to :user
end
