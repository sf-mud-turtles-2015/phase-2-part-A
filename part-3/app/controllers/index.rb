enable :sessions

get '/' do
  # if user
    # @user = User.find(params[:id])
  # end
  @items = Item.all
  erb :index
end

get '/register' do
  erb :register
end

post '/register' do
  p params
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
    p sessions
  else
    @errors = @user.errors.messages
    p @errors
     erb :register
  end
end

get '/login' do

  erb :login
end

# change to user id

get '/users/homepage' do
  # @user = User.find(:id)
  @items = Item.all
  erb :homepage
end


get '/logout' do
  session.clear
  redirect '/login'
end

get '/items' do
  erb :items
end

get '/users/homepage/items/new' do
  erb :item_new
end



post "/users/homepage/items/new" do
  p params
  @item = Item.create(name: params[:name], description: params[:description], auction_begin: params[:auction_begin], auction_end: params[:auction_end])
  p "*" * 100
  p @item
  redirect '/users/homepage'
end

get "/items/#{item.id}" do
  @item = Item.find(params[:id])
  erb :item
end
