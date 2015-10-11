require 'bcrypt'
enable :sessions

# did not create won items list, just reassigned won item to user

get '/users/:u_id/profile' do #may not be very restful

  if session[:id] == params[:u_id].to_i
    @items = User.find(params[:u_id]).items
    @bids = User.find(params[:u_id]).bids

    @bids.each do |bid|
      if not bid.item.active?

        winner = bid.item.bids.order(value: :desc).first.user_id.to_i
        bid.item.update_attributes(user_id: winner)
      end
    end

    erb :profile
  else # may want to create error message, through sessions
    redirect '/'
  end
end

  # if Item.find(6).active?
  #   p "method words"
  # else
  #   p "method works 1"
  # end
#ask about ways to use sessions less - not secure?


# Item.where(["start_date < ? AND end_date > ?", Time.now, Time.now]

#   Item.where(["start_date < ?", Time.now])

# bid.item.bids.order(value: :desc).first.user_id

# had a won items arry, and made it unique
#with @won_items << bid.item.name
# <p>Your Won Items</p>

# <% @won_items.each do |item| %>

# <li>
#   <%=item%>
# </li>

