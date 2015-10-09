enable :sessions


post '/login' do
  @user = User.find_by(username: params[:username])
 if  @user.password == params[:password]
      session[:user_id] = @user.id
    p '*'* 100
      p session
    p '*'* 100
    redirect "/profile/#{@user.id}"
  else
    redirect '/login'
  end
end


get '/session-viewer' do
  session.inspect
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/create_user' do
  erb :new_user
end

# DID NOT GET TO IMPLEMENT THIS
post '/create_user' do
  user = User.new(params[:user])

  if user.save
    # handle the happy path
    redirect '/login'
  else
    @errors = user.errors.messages
    erb :new_user
  end
end
