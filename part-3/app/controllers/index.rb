get '/' do
  erb :login
end


get '/profile/:user_id' do
  @bid_list = Bid.where(user_id: params[:user_id])
  @item_list = Item.where(user_id: params[:user_id])
  erb :profile
end

get '/items' do
  @item_list = Item.all
  erb :items
end

get '/items/:item_id' do
  @item = Item.find_by(id: params[:item_id])
  @bids = Bid.where(item_id: params[:item_id])
  @session = session[:username]
  erb :item_profile
end

get '/item/new' do
  if session[:user_id] == nil
    redirect '/items'
  else
     erb :item_new
  end

end

post '/item/new' do
  Item.create(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], end_date: params[:end_date], user_id: session[:user_id])
  redirect '/items'
end

 post '/:item_id/bid/new' do
    @id = params[:item_id]
    p @checker = Item.find(params[:item_id]).user_id
  if session[:user_id] == @checker
    redirect '/'
  else
    new_bid = Bid.new(price: params[:price], item_id: params[:item_id], user_id: session[:user_id])
    new_bid.save
  end
  redirect "/items/#{@id}"
 end

# RAN OUT OF TIME TO IMPLEMENT THIS FULLY
delete 'items/delete' do
  @item_to_destroy = Item.find(params[:item_id])
  @item_to_destroy.destroy
end

put 'items/delete' do
    @item_to_edit = Item.find(params[:item_id])
    # @item_to_edit.update
end


