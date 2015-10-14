require 'sinatra'
require 'pry-byebug'
enable :sessions

# Route to sign_up page if not logged in or if session id is nil
before do
  unless session || ['/login', '/new_user'].include?(["REQUEST_PATH"])
    binding.pry
    redirect '/login'
  end
end

get '/' do
  redirect '/items'
end

# homepage / items main page
get '/items' do
  if session[:user_id] != nil # workaround for a bug where logout crashed
    @items = Item.all
    @user = User.find(session[:user_id])
    erb :index
  else
    redirect '/login'
  end
end

# register page
get '/new_user' do
  erb :'user/sign_up'
end

post '/new_user' do
  @user = User.create({username: params[:username], password: params[:password]})
  session[:username] = @user.username
  session[:user_id] = @user.id
  if @user.errors.any?
    @errors = @user.errors.messages
    @user = nil # set erroneous @user object to nil to prevent layout from picking it up on refresh of erb :sign_up
    session[:username] = nil
    session[:user_id] = nil
    session.clear
    erb :'user/sign_up'
  else
    redirect '/'
  end
end

# login page
get '/login' do
  erb :'user/login'
end

post '/login' do
  @user = User.find_by_username(params[:username])
  if @user != nil && @user.password == params[:password]
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect '/profile'
  else
    @errors = "Sorry, invalid password or user."
    erb :'user/login'
  end
end

# logout
get '/logout' do
  session[:username] = nil
  session[:user_id] = nil
  session.clear

  redirect '/login'
end

# profile page
get '/profile' do
  @user = User.find(session[:user_id])
  @items = Item.all
  @bids = Bid.all
  erb :'user/profile'
end
