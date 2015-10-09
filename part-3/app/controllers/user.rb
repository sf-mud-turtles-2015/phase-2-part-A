require 'bcrypt'
enable :sessions

get '/home' do
  @items = Item.all
  erb :home
end

get '/users/:u_id/profile' do #may not be very restful
  if session[:id]
    @items = User.find(params[:u_id]).items
    erb :profile
  else
    redirect '/'
  end
end
#ask about ways to use sessions less - not secure?
