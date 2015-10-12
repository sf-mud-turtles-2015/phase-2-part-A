class Item < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  def max_bid(user_id)
    #find the highest bid for this item, return it if its our user

    # p user_id, self.id
    max_bid = self.bids.maximum('bid_amount')
    if ((max_bid == nil) || (max_bid == 0))
    #not sure what I did in db validation - need to check
      return nil
    end
    #if the bid ids match
    @won_item = Bid.find_by(bid_amount: max_bid, item_id: self.id)
    # and its a closed auction?
    if ((@won_item.item.user_id == user_id) && (@won_item.item.end_date < Time.now.utc.to_i))
      return @won_item.item
    end
  end
end