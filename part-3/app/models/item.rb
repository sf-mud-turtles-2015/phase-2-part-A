class Item < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :bids, as: :bidable  
end
