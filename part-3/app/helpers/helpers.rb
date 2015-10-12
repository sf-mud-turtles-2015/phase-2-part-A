helpers do

  def items_won
    @won_items = []
    bids = User.find(session[:id]).bids

    bids.each do |bid|
      if bid.item.end_date.past?
        # p 'hello'
        item = Item.find(bid.item.id)
        p item
        max_bid = item.bids.order("bid_amount DESC").first

        if max_bid.user_id == session[:id]
          @won_items << Item.find(max_bid.item_id)
        end
        p "*" * 100
        p @won_items
        p "*" * 100
      end
    end
  end






end