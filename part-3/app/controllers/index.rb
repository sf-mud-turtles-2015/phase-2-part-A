get '/' do 
	redirect '/items'
end	

get '/login' do
	erb :login
end	

get '/logout' do 
	session[:user_id] = nil
	redirect '/'
end	
