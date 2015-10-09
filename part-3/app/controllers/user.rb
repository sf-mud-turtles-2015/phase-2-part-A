get '/user/:id' do
  @user = User.find(params[:id])
  @items = @user.items
  if session[:user_id]
    @signed_in = true
  end
  erb :profile
end

post '/user/:u_id/auction' do
  Item.create(name: params[:name], description: params[:description], start: params[:start], finish: params[:finish], user_id: params[:u_id])
  redirect "/user/#{params[:u_id]}"
end

get '/user/:u_id/auction/:i_id/edit' do
  @user = User.find(session[:user_id])
  p @user
  @item = Item.find(params[:i_id])
  p @item
  erb :edit_item
end

put '/user/:u_id/auction/:i_id' do
  @item = Item.find(params[:i_id])
  p '=' * 90
  p @item
  @item.update_attributes(name: params[:name], description: params[:description], start: params[:start], finish: params[:end])
  p @item
  redirect "/user/#{session[:user_id]}"
end

delete '/user/:u_id/auction/:i_id' do
  @item = Item.find(params[:i_id])
  p '=' * 90
  p @item
  @item.destroy
  p @item
  redirect "/user/#{session[:user_id]}"
end

