enable :sessions
# => homepage
get '/' do
  redirect '/index'
end

get '/index' do
  erb :index
end

# => log out
post '/index' do
  session[:user_id] = nil
  redirect '/index'
end

# => login
get '/login' do
  @error = nil
  erb :login
end

post '/login' do
  user = User.find_by(user: params[:user])
  if user && user.password_hash == params[:password]
    session[:user_id] = user.id
    redirect '/index'
  else
    @error = true
    erb :login
  end
end

# => sign up
get '/register' do
  @error = nil
  erb :register
end

post '/register' do
  @user = User.create(user: params[:user], password_hash: params[:password])
  if @user.id.nil?
    @error = true
    erb :register
  else
    session[:user_id] = @user.id
    redirect '/index'
  end
end

# => user profile
get '/profiles/:pid' do
  @user_name = User.find_by(id: session[:user_id]).user
  erb :profile
end

# => create an item for bidding from profile
post '/profiles/:pid' do
  @item = Item.create(name: params[:name], bid_price: params[:bid_price], description: params[:description], start: params[:start], end: params[:end], seller_id: session[:user_id], bidder_id: 0 )
  redirect "profiles/#{params[:pid]}"
end

# => edit an item by owner

get '/items/:iid/edit' do
  @item = Item.find(params[:iid])
  erb :edit
end

post '/items/:iid/edit' do
  Item.find(params[:iid]).update(name: params[:name], bid_price: params[:bid_price], description: params[:description], end: params[:end])
  redirect "profiles/#{session[:user_id]}"
end

# => remove an item
post '/items/:iid/delete' do
  Item.find(params[:iid]).destroy
  redirect "profiles/#{session[:user_id]}"
end

# => bid an item
post '/items/:iid/bid' do
  redirect "profiles/#{session[:user_id]}"
end

