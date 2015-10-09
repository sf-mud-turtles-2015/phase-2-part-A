enable :sessions

get '/' do
  redirect '/items/all'
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
  redirect '/items/all'

end

#create new user
post '/user' do
  user = User.new(
    user_name: params[:user_name],
    password: params[:password]
    )
    if user.save
      redirect '/items/all'
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
    redirect '/'
  else
    # was getting an error with this....
    # @errors = @user.errors.messages
    erb :signup
  end
end

#list new items
get '/items/all' do
  @item = Item.all

  erb :homepage
end



