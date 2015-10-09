# Caveat! Some parts of this application may be broken since I implemented bids with
# custom foreign keys (i.e. user_id became owner_id) and I may have missed updating some
# instances referencing user_id before time ran out. Known to do: implement bidding using
# already-created models and migrations (although I didn't have time to test/polish)

get '/' do
  @available_items = Item.where("close >= ?", Date.today)
  erb :index
end

get '/login' do
  erb :login
end

get '/register' do
  erb :registration
end

post '/confirm_register' do
  @user = User.new(params[:registration])
  if @user.save
    session_setter(@user)
    redirect '/'
  else
    erb :registration # If validation error, reload the index with forms
  end
end

post '/session' do # Where a login posts
  @user = User.find_by(email: params[:email])
  if @user && @user.password == params[:password] #Bcryptify this?
    session_setter(@user)
    redirect '/'
  else
    erb :login
  end
end

get '/profile' do
  if session[:owner_id]
    @items = Item.all
    erb :profile
  else
    erb :restricted
  end
end

post '/items' do
  item = Item.new(params[:item])
  item.user = User.find(session[:owner_id])
  item.save
  redirect '/profile'
end

get '/items/new' do
  erb :new_item
end

get '/items/:id' do
  @item = Item.find(params[:id])
  erb :item
end

get '/items/:id/edit' do
  if session[:owner_id]
    @item = Item.find(params[:id])
    erb :edit_item
  else
    erb :restricted
  end
end

put '/items/:id' do
  @item = Item.find(params[:id])
  @item.update_attributes(params[:item])
  redirect '/profile'
end

delete '/items/:id' do
  @item = Item.find(params[:id])
  @item.destroy
  redirect '/profile'
end

get '/logout' do
  session[:owner_id] = nil
  redirect '/'
end
