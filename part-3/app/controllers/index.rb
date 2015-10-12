get '/' do 
	redirect '/items'
end	

get '/items' do 
	@items = Item.all
	erb :'items/index'

end	



# get '/login' do
# 	erb :login
# end	

# get '/logout' do 
# 	session[:user_id] = nil
# 	redirect '/'
# end	
