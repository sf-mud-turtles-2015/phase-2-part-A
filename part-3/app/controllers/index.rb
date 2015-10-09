enable :sessions
# => HOMEPAGE
get '/' do
  redirect '/index'
end

get '/index' do
  erb :index
end

# => LOG OUT
post '/index' do
  session[:user_id] = nil
  redirect '/index'
end

# => LOGIN PAGE
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

# => SIGNUP PAGE
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

# =>
