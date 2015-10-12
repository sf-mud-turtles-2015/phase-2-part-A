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
  @item_list.each {|item| item.active?}
  @items_active = Item.where(active: true)
  @items_inactive = Item.where(active: false)
  erb :items
end

get '/items/:item_id' do
  @item = Item.find_by(id: params[:item_id])
  @bids = Bid.where(item_id: params[:item_id])
  @bids.each {|bid| bid.top_bid?}
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
  new_item = Item.new(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], end_date: params[:"end_date"], user_id: session[:user_id], active: true)
  if new_item.save
    redirect '/items'
  else
    @errors = new_item.errors.messages
    erb :item_new
  end
end

 post '/:item_id/bid/new' do
    @id = params[:item_id]
    @item = Item.find_by(id: params[:item_id])
    @bids = Bid.where(item_id: params[:item_id])
    @checker = Item.find(params[:item_id]).user_id
  if session[:user_id] == @checker
    redirect "/items/#{@id}"
  else
    new_bid = Bid.new(price: params[:price], item_id: params[:item_id], user_id: session[:user_id])
    if new_bid.save
      redirect "/items/#{@id}"
    else
      @errors = new_bid.errors.messages
      erb :item_profile
    end
  end
 end


delete '/items/:item_id' do
  @item_to_destroy = Item.find(params[:item_id])
  @item_to_destroy.destroy
  redirect "/profile/#{session[:user_id]}"
end

get '/items/:item_id/edit' do
  @item_to_edit = Item.find(params[:item_id])
  erb :items_edit
end

 put '/items/:item_id/edit' do
     @item_to_edit = Item.find(params[:item_id])
     @item_to_edit.update(name: params[:name], description: params[:description], price: params[:price], end_date: params[:end_date])
     if  @item_to_edit.save
      redirect "/profile/#{session[:user_id]}"
     else
       @errors = @item_to_edit.errors.messages
       erb :items_edit
     end

 end


