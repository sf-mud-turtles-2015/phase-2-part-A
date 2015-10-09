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
