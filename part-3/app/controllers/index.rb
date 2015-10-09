# => HOMEPAGE
get '/' do
  redirect '/index'
end

get '/index' do
  erb :index
end

# => LOGIN PAGE
get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(email: params[:email])    # we need a unique identifier for the user!
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/index'
  else
    @errors = {login_error: 'user name or password incorrect, try again'}
    redirect '/login'
  end
end

# => SIGNUP PAGE
get '/register' do
  erb :register
end

post '/register' do
  @user = User.create(email: params[:email], password: params[:password])
  session[:user_id] = @user.id
  redirect '/index'
end

# =>
