class Bid < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  def top_bid?
    if self.item.bids.maximum('price') == self.price
      self.update(:top_bid => 'true')
    else
      self.update(:top_bid => 'false')
    end
  end

validates :item_id, :user_id, :price, presence: true
validates_numericality_of :price, :on => :create
end
