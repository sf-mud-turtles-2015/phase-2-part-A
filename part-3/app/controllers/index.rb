get '/' do
  erb :login
end

post '/login' do
  p params
  @user = User.find_by(username: params[:username])
  if @user == nil
    redirect  '/'
  elsif @user.password == params[:password]
    redirect "/profile/#{@user.id}"
  else
    redirect '/'
  end
end

get '/profile/:user_id' do
  @bid_list = Bid.where(user_id: params[:user_id])
  @item_list = Item.where(user_id: params[:user_id])
  erb :profile
end

get '/items' do
  @item_list = Item.all
  erb :items
end

get '/items/:item_id' do
  @item = Item.find_by(id: params[:item_id])
  @bids = Bid.where(item_id: params[:item_id])
  @session = session[:username]
  erb :item_profile
end

# post '/item/new' do
# end

 post '/:item_id/bid/new' do
  # p session[:user_id]
   @id = params[:item_id]
   p params
  redirect "/items/#{@id}"
 end
