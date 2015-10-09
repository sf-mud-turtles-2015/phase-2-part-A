class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :item_id, :user_id, :bid_amount, presence: true
end
