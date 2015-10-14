class Item < ActiveRecord::Base
  belongs_to :user

  has_many :auction_bids, class_name: "Bid"
  belongs_to :auction_participant, class_name: "User", foreign_key: 'user_id'


  validates :name, presence:true
  validates :category, presence: true
  validates :minimum_bid, presence: true
  validates :status, presence: true
end
