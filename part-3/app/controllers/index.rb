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

  @user = User.new(params[:user])
    if @user && @user.save
      session[:user_id] = @user.id
      redirect '/items/all'
    else
      @errors = @user.errors.messages

      erb :signup
    end
end

# login logic
post '/login' do
  @user = User.find_by(user_name: params[:user_name])

  if @user && params[:password] == @user.password
    session[:user_id] = @user.id
    redirect '/'
  else
    # was getting an error with this....
    # puts "X" * 100
    # p @errors
    # "incorrect username or password"
    erb :login
  end
end

#list all items
get '/items/all' do
  @item = Item.all
  #to_i is so i can compare time
  # Time.now seems to be off for about 25k...
  @time = Time.now.to_i
  @time -= 30000

  erb :homepage
end



