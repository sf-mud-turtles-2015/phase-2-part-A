get '/users/new' do

  erb :"/users/register"

end

post '/users' do
  @user = User.new(params[:user])
  if @user.save && (params[:user][:password].length >= 6)
    session[:id] = @user.id
    redirect '/'
  else

    if @user.errors[:username].any?
      flash[:error] = 'That username is already in use or invalid'
    elsif params[:user][:password].length < 6 #Need to fix, not working with bcrypt
      flash[:error] = 'Your password must be 6 characters or longer'
    else
      flash[:error] = 'There was an error in your registration. Please try again.'
    end
    redirect '/users/new'

  end
end

get '/users/login' do

  erb :"/users/login"

end

get '/users/logout' do

  session.destroy
  redirect '/'
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.password == params[:user][:password]
    session[:id] = @user.id
  else
    flash[:error] = "The username or password you entered is invalid." #not sure if using correctly
    redirect '/users/login'
  end

  redirect '/'
end

get '/users/profile' do
  @items = Item.all
  @your_items = Item.where(user_id: session[:id])
  @won_items = []
  bids = User.find(session[:id]).bids

  # Need to make a helper method for below _-----_
  bids.each do |bid|
    if bid.item.end_date.past?
      # p 'hello'
      item = Item.find(bid.item.id)
      p item
      max_bid = item.bids.order("bid_amount DESC").first

      if max_bid.user_id == session[:id]
        @won_items << Item.find(max_bid.item_id)
      end
      p "*" * 100
      p @won_items
      p "*" * 100
    end
  end
   # Need to make a helper method for above _-----_

  erb :"/users/profile"
end
