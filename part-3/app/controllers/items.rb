get '/items/:id' do
  user = User.find(session[:user_id])
  listed_item = Item.find(params[:id])
  if session[:user_id]
    erb :"/items/view_item", locals: {user: user, item: listed_item}
  else
    @bid_error = "Please login or signup to view listings"
    erb :"/users/login"
  end
end

get '/bids/:id' do
  bidded_item = Item.find(params[:id])
  current_user = User.find(session[:user_id])
  p "%" * 100
  p bidded_item.user #user who posted the item
  p current_user  # active user
  p "%" * 100
  erb :"items/update_delete_item"
end


