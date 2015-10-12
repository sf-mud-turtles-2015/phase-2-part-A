class Item < ActiveRecord::Base
  has_many :users, through: :bids
  has_many :bids
  # Remember to create a migration!
end
