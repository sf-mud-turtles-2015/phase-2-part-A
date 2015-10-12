require 'date'
enable :sessions

get '/' do
  if current_user
    redirect '/index'
  else
    redirect '/login'
  end
end

get '/login' do
  @items_avail = Item.where("stop_date >= ? AND start_date <= ?", Date.today, Date.today)
  erb :login
end

get '/index' do
  if current_user
    @bidable_items = Item.where("stop_date >= ? AND start_date <= ? AND user_id != ?", Date.today, Date.today, current_user.id.to_s)
    @past_items = Item.where("stop_date < ?", Date.today)
    erb :index
  else
    redirect '/login'
  end
end

post '/index' do
  @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/index'
  else
    @errors = "Username or Password is incorrect"
    @items_avail = Item.where("stop_date >= ? AND start_date <= ?", Date.today, Date.today)
    erb :login
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end

get '/register' do
  erb :register
end

post '/register' do
 user = User.new(params[:user])
  if user.save
    redirect '/login'
  else

    @errors = user.errors.full_messages.join(", ")
    erb :register
  end
end

get '/profile' do
  if current_user
    @items = Item.where(user_id: current_user.id)

    erb :profile
  else
    redirect '/login'
  end
end

get '/add_item' do
  if current_user
    erb :add_item
  else
    redirect '/login'
  end
end

post '/add_item' do
  current_user.items.new(params[:item])
  if current_user.save
    redirect  '/profile'
  else
   p @errors = current_user.errors.full_messages
    erb :add_item
  end
end

get '/items/:item_id' do
 @item = Item.find(params[:item_id])
 erb :item
end

get '/items/:item_id/edit' do
  if current_user
    @item = Item.find(params[:item_id])
    erb :edit_item
  else
    redirect '/login'
  end
end

put '/items/:item_id' do
  if current_user
    item = Item.find(params[:item_id])
    item.update(params[:item])
    redirect '/profile'
  else
    redirect '/login'
  end
end

delete '/items/:item_id' do
  item = Item.find(params[:item_id])
  item.delete
  redirect '/profile'
end

post '/items/:item_id/bid' do
  current_user.bids.create(amount: params[:amount],item_id: params[:item_id] )
  redirect "/items/#{params[:item_id]}"
end












