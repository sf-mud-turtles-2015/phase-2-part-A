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
      # when the validation fails message is stored in errors.messages, the @errors is just a var...
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

    #has no relation to the @errors above just a var!
    @errors = "incorrect username or password"

    erb :login
  end
end

#list all items
get '/items/all' do
  @item = Item.all
  #to_i is so i can compare time
  # Time.now seems to be off for about 25k...
  # thought I could subtract 25k but it does not work....
  @time = Time.now.to_i

  erb :homepage
end



