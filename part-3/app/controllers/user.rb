get '/user/:id' do
  @user = User.find(params[:id])
  @items = @user.items
  @bids = @user.bids
  if session[:user_id]
    @signed_in = true
  end

  erb :profile
end

post '/user/:u_id/auction' do
  start = params[:start].scan(/\d/).join.to_i
  finish = params[:finish].scan(/\d/).join.to_i
  Item.create(name: params[:name], description: params[:description], start: start, finish: finish, user_id: params[:u_id])
  redirect "/user/#{params[:u_id]}"
end

get '/user/:u_id/auction/:i_id/edit' do
  @user = User.find(session[:user_id])
  @item = Item.find(params[:i_id])
  erb :edit_item
end

put '/user/:u_id/auction/:i_id' do
  @item = Item.find(params[:i_id])
  start = params[:start].scan(/\d/).join.to_i
  finish = params[:finish].scan(/\d/).join.to_i
  @item.update_attributes(name: params[:name], description: params[:description], start: start, finish: finish)
  redirect "/user/#{session[:user_id]}"
end

delete '/user/:u_id/auction/:i_id' do
  @item = Item.find(params[:i_id])
  @item.destroy
  redirect "/user/#{session[:user_id]}"
end

