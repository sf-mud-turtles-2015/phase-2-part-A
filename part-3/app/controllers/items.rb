post '/items' do
  # p params
  @item = Item.create(user_id: session[:id], name: params[:name], description: params[:description], start_date: params[:start_date], end_date: params[:end_date])
  redirect '/users/profile'
end

get '/items/:id' do
  @item = Item.find(params[:id])
  @number_bidders = @item.bids.group(:user).count.length

  erb :"/items/show"
end

get '/items/update/:id' do
  @item = Item.find(params[:id])

  erb :"/items/edit"
end

put '/items/:id' do
  @item = Item.find(params[:id])

  @item.update_attributes(name: params[:name], description: params[:description], start_date: params[:start_date], end_date: params[:end_date])

  redirect '../users/profile'
end

delete '/items/:id' do
  Item.find(params[:id]).destroy

  redirect '/users/profile'
end

post '/items/:id/bids/new' do

  bid = Bid.new(user_id: session[:id], item_id: params[:id], bid_amount: params[:bid_amount])
  post_id = params[:id]

  if bid.save
    session[:bid] = 1
  end

  redirect "/items/#{post_id}"
end
