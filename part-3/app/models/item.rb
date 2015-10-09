class Item < ActiveRecord::Base
  has_many :users
  has_many :bids
end
