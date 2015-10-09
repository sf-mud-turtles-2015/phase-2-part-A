require 'sinatra/flash'
get '/' do

  erb :'index'
end

get '/users/login' do

  erb :'/users/login'
end

get '/users/register' do
  erb :'/users/register'
end

post '/users/register' do
  @user = User.new(params[:user])
  if (params[:user][:password].length) < 6
    flash[:error] = "Passwords must be six characters or longer"
    redirect '/users/register'
  end
  if @user.save
    auth_login(@user)
    redirect "/"
  else
    flash[:error] = "That user already exists"
    redirect '/users/register'
  end
end

post '/users/login' do
  @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    auth_login(@user)
    redirect "/"
  else
    erb :'/users/login'
  end
end

get '/users/:id' do
  @user = User.find(session[:user_id])
  @items = Item.all
  @bids = Bid.where(user_id: session[:user_id])

  erb :'/users/profile'
end

get '/logout' do
  session.destroy
  redirect '/'
end
