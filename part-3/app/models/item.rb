
class Item < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :seller, class_name: :User
  belongs_to :bidder, class_name: :User

  validates :name, :description, :start, :end, :bid_price, presence: true
end

# Item.create(name: 'second item' , description: 'none', start: '???', end: '???', seller_id: 1, bidder_id: 0)
