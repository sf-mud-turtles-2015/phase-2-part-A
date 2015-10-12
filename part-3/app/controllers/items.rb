post '/items' do
  user = User.find(session[:user_id])
  item = Item.create(title: params[:title], detail: params[:detail], condition: params[:condition], start_date: params[:start_date], end_date: params[:end_date], user_id: user.id)
  redirect "/users/#{ user.id }"
end

get '/items/:id' do
  listed_item = Item.find(params[:id])
  if session[:user_id]
    user = User.find(session[:user_id])
    erb :"/items/view_item", locals: {user: user, item: listed_item}
  else
    @bid_error = "Please login or signup to view listings"
    erb :"/users/login"
  end
end

get '/items/:id/delete' do
  item = Item.find(params[:id])
  user = item.user
  item.destroy
  erb :"/users/profile_page", locals: {user: user}
end

post '/items/:id/bids' do
  user = User.find(session[:user_id])
  bid = Bid.create(amount: params[:amount], user_id: user.id, item_id: params[:id])
  redirect "items/#{params[:id]}"
end

get '/bids/:id' do
  bidded_item = Item.find(params[:id])
  current_user = User.find(session[:user_id])
  erb :"items/update_delete_item", locals: {bidded_item: bidded_item, current_user: current_user}
end


