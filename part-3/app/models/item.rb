class Item < ActiveRecord::Base
  belongs_to :user
  has_many :bids


  def find_max(user_id)
    # max amount that was bind for an item the user bid on...
    total_max = self.bids.maximum(:amount)

    #if the bid ids match then return item....
    @won_item_bid = Bid.where(amount:total_max).find_by(user_id: user_id)

     # check to see if the item with the highest bid matches our user
     # check to see if the end_Date is less then the time.now(might be off by 30k)
    if (@won_item_bid.user_id == user_id) &&
       (@won_item_bid.item.end_date.to_i < Time.now.to_i)

        return @won_item_bid.item.name

    else
    end
  end
end
