require 'sinatra'
enable :sessions

get '/' do
  erb :index
end

get '/new' do
  erb :sign_up
end

post '/new' do
  @user = User.create({username: params[:username], password: params[:password_hash]})
  session[:username] = @user.username
  if @user.errors.any?
    @errors = @user.errors.messages
    @user = nil # set erroneous @user object to nil to prevent layout from picking it up on refresh of erb :sign_up
    session[:username] = nil
    session.clear
    erb :sign_up
  else
    redirect '/'
  end
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by_username(params[:username])
  if @user != nil && @user.password == params[:password_hash]
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect '/profile'
  else
    @errors = "Sorry, invalid password or user."
    erb :login
  end
end

get '/logout' do
  session[:username] = nil
  session.clear

  redirect '/'
end

get '/profile' do
  erb :profile
end
