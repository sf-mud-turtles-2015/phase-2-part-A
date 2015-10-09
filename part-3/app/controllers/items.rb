# All the routes about items will be here...

#dealing with the erb :homepage for layouts....
enable :sessions

#goto profile page
get '/profile/:id' do
  @user = User.find(params[:id])

  @items = Item.where(user_id: params[:id])

  erb :profile
end

#create a new item
post '/item/:u_id' do
  #there must be a better way to do this....
  Item.create(
    name: params[:name],
    description: params[:description],
    date_start: params[:date_start],
    date_end: params[:date_end],
    user_id: params[:u_id]
    )
  redirect "/profile/#{params[:u_id]}"
end

#delete item
delete '/item/:id' do
  item = Item.find(params[:id])
  item.destroy

  redirect "/profile/#{session[:user_id]}"
end

#update item
get '/item/:id' do
  @item = Item.find(params[:id])

  erb :edit_item
end

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









