get '/bids/active' do
  @items = Item.where("start_time < ? AND end_time > ?", Time.now, Time.now)

  erb :'/bids/active'
end

post '/bids' do
  bid = Bid.create(params[:bid])
  bid.update(user_id: session[:user_id])

  redirect 'users/profile'
end
