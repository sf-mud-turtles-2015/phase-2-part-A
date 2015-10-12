

enable :sessions

###############  Controller Helper Methods

def date_to_utc_seconds(date)
  year_month_day = date.split('-')
  Time.utc(year_month_day[0].to_i,year_month_day[1].to_i,year_month_day[2].to_i,0,0,0).to_i
end

def session_id_user_id_match?
  session[:id] == Item.find(params[:i_id]).user_id
end

################ Main Page

get '/' do
  # p "get / #{params}"
  # p "session id: #{session}"
  all_items = Item.all
  @items = all_items.select do |item|
   item.start_date < Time.now.utc.to_i && item.end_date > Time.now.utc.to_i
  end
  erb :index
end

#################logon

get '/login' do
  erb :'login'
end

post '/login' do
  # p "post login #{params}
  user = User.find_by(name: params[:name])
  #make sure user exists and password matches hash
  if user && user.password == params[:password]
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
  erb :register
end

post '/register' do
  # p "post register #{params}"
  if params[:password].length <= 6
    @errors = "The password should be at least 6 charactors long"
    redirect '/register'
  else
    user = User.new(name: params[:name], password: params[:password])
    if user.save
      session[:id] = user.id
      redirect '/login'
    else
      @errors = "That name is already registered, please enter your other one!"
      redirect '/register'
    end
  end
end

###############Logout#############
get '/logout' do
  session[:id] = nil
  redirect '/'
end

############### User Profile

get '/profile' do
  # p " profile get #{params}"
  if session[:id]
    @user = User.find(session[:id])
    @user_items = Item.where(user_id: session[:id])
    # find all items won by this user
    @user_wins = []
    @user_items.each do |item|
      if item.max_bid(session[:id]) != nil
        @user_wins << item.max_bid(session[:id])
      end
    end
    #find all bids placed by the user
    @user_bids = @user.user_bids
  else
    redirect '/login'
  end
  erb :profile
end



delete '/delete/:i_id' do
  p "delete/:i_id #{params}"
  #check that the session id and the item's user_id match
  if session_id_user_id_match?
    #should have used new referential integrity methods in model
    bids = Bid.where(item_id: params[:i_id])
    bids.each {|bid| bid.destroy}
    Item.find(params[:i_id]).destroy
    redirect "/profile"
  else
    redirect '/logout'
  end
end

########### Update Item
get '/update/:i_id' do
  @item = Item.find(params[:i_id])
  erb :edit
end

put '/update/:i_id' do
  # p "update/:i_id #{params}"
  if session_id_user_id_match?
    #convert back to unix utc seconds
    attributes = {
        item_title: params[:item_title],
        item_description: params[:item_description],
        #convert back to unix utc seconds
        end_date: date_to_utc_seconds(params[:end_date]),
        start_date: date_to_utc_seconds(params[:start_date])
    }
    #find and update item
    Item.find(params[:i_id]).update_attributes(attributes)
    redirect '/profile'
  else
    redirect '/logout'
  end
end



########## List an new Item for Auction
get '/add' do
  erb :add
end



post '/add' do
  #todo add commit checking
  Item.create(item_title: params[:item_title],
              item_description:  params[:item_description],
              start_date:  date_to_utc_seconds(params[:start_date]),
              end_date: date_to_utc_seconds(params[:end_date]),
              user_id: params[:id])
  redirect '/profile'
end

### bids

get '/bid/:i_id' do
  # p "get bid: #{:i_id} params #{params}"

  @item = Item.find(params[:i_id])
  #check to see if the last bid placed was by this user
  p "Bidder #{Bid.where(item_id: params[:i_id]).last.user_id} Session #{session[:id]}"
  if  Bid.where(item_id: params[:i_id]).last.user_id == session[:id]
    @message = "Thanks for placing your bid, good luck!"
  end
  #get number of bids and highest bid
  @bid = [@item.bids.length, @item.bids.maximum('bid_amount')]
  erb :bid
end

post '/bid/:i_id' do
 # p "post bid #{params}"
 item = Item.find(params[:i_id])
 item.bids.create(bid_amount: params[:bid_amount], user_id: session[:id])
 redirect "/bid/#{params[:i_id]}"
end

