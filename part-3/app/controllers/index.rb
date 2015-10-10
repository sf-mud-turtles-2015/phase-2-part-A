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
  @user = User.new(params[:user_id])
    if @user && @user.save

      session[:user_id] = @user.id
      redirect '/items/all'
    else
      @errors = @user.errors.messages

      puts "X" * 100
      p @errors
      puts "X" * 100

      erb :signup
    end
end

# login logic
post '/login' do
  @user = User.find_by(
    user_name: params[:user_name]\
    )

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
  #to_i is so i can compare time
  @time = Time.now.to_i

    erb :homepage
end



