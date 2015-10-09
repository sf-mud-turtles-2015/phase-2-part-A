class Item < ActiveRecord::Base
  belongs_to :user
  has_many :bidders, class_name: "User"
end
