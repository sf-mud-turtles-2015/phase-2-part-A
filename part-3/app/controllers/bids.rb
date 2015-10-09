
post '/bid/item/:id' do
  #create new bid with item
  @bid = Bid.create(item_id: params[:id])
  # run the vote up which adds one?
  # actually maybe I should get the total vote count add 1 and then just create with updated number??
  @bid.up_vote

end
