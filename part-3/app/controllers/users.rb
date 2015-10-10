get '/' do
  items = Item.all
  erb :index, locals: {items: items}
end

get '/users/login' do
    erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:username])

  if @user && @user.password == params[:password]
    auth_login(@user)
    redirect "/users/#{@user.id}"
  else
    @form_error = 'Unable to log you in'
    erb :'users/login'
  end

end

get '/users/signup' do
  @user = User.new
  erb :'users/signup'
end

post '/users/signup' do
  @user = User.new(username: params[:username], password: params[:password])

  if @user.save
    auth_login(@user)
    redirect "/users/#{@user.id}"
  else
    @form_error = 'Unable to register you'
    erb :'users/signup'
  end
end

get '/home' do
  user = User.find(session[:user_id])
  erb :home, locals: {user: user}
end

get '/users/:id' do
  user = User.find(params[:id])
    erb :"users/profile_page", locals: {user: user}
end

get '/logout' do
  auth_logout
end
