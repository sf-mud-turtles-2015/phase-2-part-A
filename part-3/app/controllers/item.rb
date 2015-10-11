# Item View
get '/:id' do
  @user = User.find(session[:user_id])
  @item = Item.find(params[:id])
  erb :item_view
end

# Item Creation
post '/items' do
  @user = User.find(session[:user_id])
  @item = Item.create({name: params[:name], category: params[:category], minimum_bid: params[:minimum_bid], status: "for_sale", start_date: params[:start_date],end_date: params[:end_date], user_id: @user.id})
  if @item.errors
    @errors = @item.errors.messages
    redirect '/profile'
  end
end

# Item Update
put '/items/:id' do
  @item = Item.find(params[:id])
  @user = User.find(session[:user_id])
  if @item.user_id == @user.id
    @item.update(name: params[:name], category: params[:category], minimum_bid: params[:minimum_bid], start_date: params[:start_date], end_date: params[:end_date])
  end
  redirect '/profile'
end

# Item Delete
delete '/items/:id' do
  @item = Item.find(params[:id])
  @user = User.find(session[:user_id])
  if @item.user_id == @user.id
    @item.destroy
  end
  redirect '/profile'
end
