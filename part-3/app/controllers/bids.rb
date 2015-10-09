get '/bids/active' do
  @items = Item.where("start_time < ? AND end_time > ?", Time.now, Time.now)

  erb :'/bids/active'
end

post '/bids' do
  bid = Bid.create(params[:bid])

  redirect 'users/profile'
end
