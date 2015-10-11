enable :sessions

# All the routes about items will be here...

#goto profile page
get '/profile/:id' do
  @user = User.find(params[:id])
  @items = Item.where(user_id: params[:id])
  #dont think i need these but not going to test it...
  @bid_items = Bid.where(user_id: session[:user_id])
  @all_bids = Bid.all

  erb :profile
end

#create a new item
post '/item/:u_id' do
  Item.create(params[:item])
  redirect "/profile/#{params[:u_id]}"
end

#delete item
delete '/item/:id' do
  item = Item.find(params[:id])
  item.destroy

  redirect "/profile/#{session[:user_id]}"
end

#View Item Page
get '/item/:id' do
  @item = Item.find(params[:id])

  erb :edit_item
end

#update Item
put '/item/:id' do
  user_id = session[:user_id]
  item = Item.find(params[:id])

  item.update_attributes(params[:item])

  redirect "/profile/#{session[:user_id]}"
end

#Individual item bidding page
get '/item/:id/bid' do
  erb :item_bid
end









