

enable :sessions

get '/' do
  # p "get / #{params}"
  # p "session id: #{session[:id] }"

  ######## todo
  # there's bunch data to pull out and display based on session id,
  # e.g. state such as edit delete links owned by this user

  @items = Item.all
  erb :index
end

#################logon

get '/logon' do
  erb :'login'
end


post '/login' do
  # p "post login #{params}
  user = User.find_by(name: params[:name])    # we need a unique identifier for the user!
  if user && user.password == params[:password]
    # p "user found"
    session[:id] = user.id
    p "found user and session id #{session[:id]}"
    redirect '/'
  else
    @errors = "user name or password incorrect, try again"
    erb :'login'
  end
end



###########  register

get '/register' do
  erb :registration
end

post '/register' do
  # p "post register #{params}"
  user = User.new(name: params[:name], password: params[:password])
  if user
      user.save
    session[:id] = user.id
    p "register new user and session id #{session[:id]}"
    redirect '/'
  else
    @errors = "That Name is already registered"
    redirect '/registration'
  end
  redirect '/'
end

###############Logout#############
post '/logout' do
  session[:id] = nil
  redirect '/'
end

###############User Profile

get '/profile' do
  # this method gets users that are active items using the session id = user_id
    # lists current bids associated with item (if any)
    #It also lists all won items - need to update the view to take and display this data
  p " profile get #{params}"
  erb :profile
end


########## List an new Item for Auction
get '/add' do
  erb :add
end

post '/add' do
  #this method gets the form and posts the data for a new item, using hidden session:id = user_id
  # p " add #{params}"
  Item.create(item_title: params[:item_title],
              item_description:  params[:item_description],
              start_date:  params[:start_date],
              end_date: params[:end_date],
              user_id: params[:id])
  redirect '/profile'
end
