get '/item/:i_id' do
  @item = Item.find(params[:i_id])
  erb :view_item
end

post "/item/:i_id/bid" do
  bid = Bid.create(amount: params[:amount], item_id: params[:i_id], user_id: session[:user_id])
  @item = Item.find(params[:i_id])
  @bid_placed = "Thank you for your bid of #{bid.amount}. Good luck!"
  erb :view_item
end
