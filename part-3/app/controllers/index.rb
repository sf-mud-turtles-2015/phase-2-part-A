enable :sessions

get '/' do
  erb :index
end

get '/users' do
  erb :users
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/users'
  else
    redirect '/'
  end
end

post '/signup' do
  user = User.new(email: params[:email], password: params[:password])
  p params[:password]
  if user.save
    "*" * 80
    session[:user_id] = user.id
    redirect '/users'
  else
    @errors = user.errors.full_messages
    p @errors
    erb :index
  end
end

get '/users/:user_id' do
  @user = User.find(session[:user_id])
  @items = Item.all
  erb :profile
end

post '/logout' do
  session.destroy
  redirect '/'
end

post '/users/:user_id/items' do
  Item.create(title: params[:title], description: params[:description], start_date: params[:start_date], end_date: params[:end_date], user_id: session[:user_id])
  p "*" * 80
  redirect "/users/#{session[:user_id]}"
end

# form to edit
get '/users/:user_id/items/:item_id/edit' do
  p params[:item_id]
  @item = Item.find(params[:item_id])
  erb :edit_item
end

put '/users/:user_id/items/:item_id' do
  "hi"
  # p params
  # item = Item.find_by(id: params[:item_id])
  # p item

  # item.update_attributes(title: params[:title])
  # redirect "/users/#{session[:user_id]}"
end

delete '/users/:user_id/items/:item_id' do
  p params
  item = Item.find(params[:item_id])
  item.destroy
  redirect "/users/#{session[:user_id]}"
end

get '/users/:user_id/items/:item_id' do
  @item = Item.find(params[:item_id])
  @bidders = @item.bids.count
  erb :show_item
end

post '/users/:user_id/items/:item_id/bid' do
  item = Item.find(params[:item_id])
  Bid.create(value: 1, item_id: item.id)
  erb :bid
end

