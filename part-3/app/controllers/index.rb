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
 @items = Item.all

  erb :login
end

get '/index' do
  if current_user
    @items = Item.where("stop_date < ? AND start_date >= ?", true, Date.today)
    erb :index
  else
    redirect '/login'
  end
end

post '/index' do
  @user = User.find_by(username: params[:username])
  if @user && user.password == params[:password]
    session[:user_id] = user.id

    erb :index
  else
    @errors = "Username or Password is incorrect"
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
    puts '*' * 100
    p user.errors
    @errors = user.errors.full_messages

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
  Item.create(name: params[:name], cost: params[:cost], description: params[:description], start_date: params[:start_date], stop_date: params[:stop_date], user_id: session[:user_id])

  redirect  '/profile'
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













