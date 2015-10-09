
##### INDEX #####
get '/' do

  erb :index
end

##### LOGIN ####
post '/login' do
  user = User.find_by(email: params[:user][:email])

  if user && user.password == params[:user][:password] #
    session[:email] = user.email # stores the info in cookies
    redirect '/'
  else
    @login_failed = true
    redirect '/'
  end
end


##### REGISTER #####
get '/register' do
  erb :register
end

post '/register' do
  user = User.new(params[:user])
  if user.save
    session[:email] = user.email
    redirect '/'
  else
    # session[:error] = user.errors.messages
    redirect '/register'
  end
end

##### LOGOUT #####

post '/logout' do
  session[:email] = nil
  redirect '/'
end

##### CREATE ITEMS #####

##### SET BIDS #####