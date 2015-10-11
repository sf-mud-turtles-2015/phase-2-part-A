enable :sessions

get '/' do
  erb :index
end

get '/users' do
  # session.destroy
  if current_user
    erb :'users/users'
  else
    redirect '/'
  end
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/users/users'
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
    redirect '/users/users'
  else
    @errors = user.errors.full_messages
    p @errors
    erb :index
  end
end

get '/users/:user_id' do
  if current_user
    @user = User.find(session[:user_id])
    @items = Item.all
    redirect '/items'
  else
    redirect '/'
  end
end

get '/items' do
  if current_user
    @user = User.find(session[:user_id])
    @items = Item.all
    erb :'items/items'
  else
    redirect '/'
  end
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
  erb :'items/edit_item'
end

put '/users/:user_id/items/:item_id' do
  item = Item.find(params[:item_id])
  p params[:item]
  item.update_attributes(params[:item])
  redirect '/items'
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
  erb :'items/show_item'
end

post '/users/:user_id/items/:item_id/bid' do
  item = Item.find(params[:item_id])
  p params
  p "*" * 80
  p params[:b]
  no = params[:b]
  p "%" * 80
  p no
  bid = Bid.create(amount: no, item_id: item.id, user_id: session[:user_id] )
  if request.xhr?
    {bidder: User.find(bid.user_id).email, amount: bid.amount }.to_json
  else
    redirect "/users/#{session[:user_id]}/items/#{item.id}"
  end
end



