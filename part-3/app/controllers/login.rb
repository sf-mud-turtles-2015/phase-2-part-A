enable :sessions

get '/' do
  p session
  if session[:user_id]
    @signed_in = true
    @user_id = session[:user_id]
  else
    @signed_in = false
  end
  @items = Item.all
  erb :home
end

#needs errors
post '/signup' do
  user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @register_error = true
    erb :home
  end
end

get '/login' do
  erb :login
end

post '/login' do
  p params
  user = User.find_by(username: params[:username])
  if user == nil || user.password != params[:password]
    @login_error = true
    @message = 'Username or Password is invalid'
    erb :login
  else
    session[:user_id] = user.id
    redirect '/'
  end
end

get '/logout' do
  session.destroy
  redirect '/'
end
