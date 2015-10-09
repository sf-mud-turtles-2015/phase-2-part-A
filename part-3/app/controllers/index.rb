require 'bcrypt'
enable :sessions

get '/' do
  # Look in app/views/index.erb
  if session[:id]
    session[:id] = nil
  end
  p session[:id]
  erb :login
end

get '/register' do

  erb :register
end

post '/register' do
  if params[:password].length < 6 #add in error message
    @password_error = "password must be 6 characters"
    erb :register
  end
  new_user = User.new(username: params[:username], password: params[:password])
  if new_user.save
    redirect '/'
  else
    @username_error = "username taken, register again"
    erb :register
  end
end

post '/login' do

  @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    session[:id] = @user.id
    p session[:id]
    redirect "/home"
  else
    redirect '/'#bug: will error if I did not register
  end
end



