class Bid < ActiveRecord::Base
  has_many :items
  has_many :bidders, class_name: "User"
end
