enable :sessions

get '/' do
  erb :homepage
end

#login page route...
get '/login' do
  erb :login
end

#signup page route
get '/signup' do
  erb :signup
end

#logout
get '/logout' do
  session.clear()
  redirect '/'

end

#create new user
post '/user' do
  user = User.new(
    user_name: params[:user_name],
    password: params[:password]
    )
    if user.save
      redirect '/'
    else
      @errors = user.errors.messages
      erb :signup
    end
end

# Signin
get '/user' do
  @user = User.find_by(user_name: params[:user_name])

  if @user && params[:password] == @user.password
    session[:user_id] = @user.id
    erb :homepage
  else
    @errors = @user.errors.messages
    erb :signup
  end
end

#signout

#list new items

#place bid on item

#have profile showing bidding activity
