enable :sessions

get '/' do
  if session[:user_id]
    @user = User.find(params[:id])
  else
    redirect '/register'
  end
  erb :index
end

get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(params[:user])
  # session[:user_id] = @user.id
  # p "session user_id"
  # p session[:user_id]
  if @user.save
    redirect '/'
    p sessions
  else
    @errors = @user.errors.messages
    p @errors
    erb :register
  end
end

get '/login' do
  erb :login
end

post '/login' do

    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
    p session[:user_id]
    redirect '/users/homepage'
end

# change to user id

get '/users/homepage' do
  @user = User.find_by(params[:id])
  if @user && @user[:password] == @user.password && session[:user_id] = @user.id
    @items = Item.all
    erb :homepage
  else
    redirect '/register'
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end

get '/items' do
  erb :items
end

get '/users/homepage/items/new' do
  erb :item_new
end



post "/users/homepage/items/new" do
  p params
  @item = Item.create(name: params[:name], description: params[:description], auction_begin: params[:auction_begin], auction_end: params[:auction_end])
  p "*" * 100
  p @item
  redirect '/users/homepage'
end

# get "/items/#{item.id}" do
#   # @item = Item.find(params[:id])
#   erb :item
# end
