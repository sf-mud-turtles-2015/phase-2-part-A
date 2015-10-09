get '/users/new' do

  erb :"/users/register"

end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
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

  session[:id] = @user.id

  redirect '/'
end

get '/users/profile' do
  @items = Item.all
  @your_items = Item.where(user_id: session[:id])
  erb :"/users/profile"
end
