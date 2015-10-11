class Item < ActiveRecord::Base
  has_many :bids
  belongs_to :user

  validates :name, presence:true
  validates :category, presence: true
  validates :minimum_bid, presence: true
  validates :status, presence: true
end
