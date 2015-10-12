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

##### PROFILE PAGE / LIST OF MY ITEMS #####

get '/profile' do

  @user = User.find_by(email: session[:email])
  @all_owned_items = @user.items

  erb :profile
end

##### AUCTION ITEMS #####

get '/items/new' do

  # p session[:email]
  @user = User.find_by(email: session[:email])

  erb :new
end

post '/items' do

  @user = User.find_by(email: session[:email])
  new_item = Item.create!(params[:item])
  @user.items << new_item

  redirect '/'
end

get '/items/:id' do

  # p params
  @user = User.find_by(email: session[:email])
  @item = Item.find(params[:id])
  owner_id = @item.user_id
  @owner = User.find(owner_id)
  erb :item
end

get '/items/:id/edit' do

  # p params
  @item = Item.find(params[:id])
  owner_id = @item.user_id
  @user = User.find(owner_id)
  @owner = User.find(owner_id)
  erb :edit
end

put '/items/:id' do

  update_item = Item.find(params[:id])
  update_item.update(params[:item])
  redirect "/items/#{update_item.id}"
end

##### DESTROY ITEMS #####

delete '/items/:id' do
  p "*" * 20
  p params[:id]
  delete_item = Item.find(params[:id])
  Item.find(delete_item).destroy
  redirect '/'
end

##### SET BIDS #####

put '/set_bid' do

 # @user = User.find_by(email: session[:email])
  p "*" * 20
  p params
  bid_item = Item.find(params[:item_id])
  redirect "/items/#{params[:item_id]}"
end