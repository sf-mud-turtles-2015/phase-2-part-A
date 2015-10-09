## FYI: Faker's names and email addresses don't neccessarily correlate. e.g. Rowland Cartwright's email is justine.carter@mcclure.org

##### INDEX #####
get '/' do

  @auction_items = Item.all

  erb :index
end

##### LOGIN ####
post '/login' do

  user = User.find_by(email: params[:user][:email])

  if user && user.password == params[:user][:password] #
    session[:email] = user.email # stores the info in cookies
    redirect '/'
  else
    # @login_failed = true
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
    redirect "/profile"
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

##### PROFILE PAGE #####

get '/profile' do

  @user = User.find_by(email: session[:email])
  @all_owned_items = @user

  erb :profile
end

##### ITEM PAGE #####

get '/items/:id' do

  # p params
  @item = Item.find(params[:id])
  owner_id = @item.user_id
  @user = User.find(owner_id)
  @owner = User.find(owner_id)
  erb :item
end

##### AUCTION ITEMS #####

get '/auction_item' do

  # p session[:email]
  @user = User.find_by(email: session[:email])

  erb :auction_item
end

post '/auction_item' do

  @user = User.find_by(email: session[:email])
  # p params
  Item.create!(params[:item])

  redirect '/'
end

##### SET BIDS #####

post '/set_bid' do

  @user = User.find_by(email: session[:email])
  p params

  redirect '/auction_item'

end