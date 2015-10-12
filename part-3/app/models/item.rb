class Item < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true
  #validates :starting_price, presence: true 

  belongs_to :user
  has_many :bids, as: :bidable 

  # def qualify_bid
  # 	starting_price <= offer ? self.bids.order(offer: :desc).first.offer : p "Enter an amount greater than the last bid" 
  # end	
end
