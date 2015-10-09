post '/items/new' do
  Item.create(name: params[:name], user_id: session[:id])
  redirect "/users/#{session[:id]}/profile"
end

get '/items/new' do
  if session[:id]
    erb :create_item
  else
    redirect '/'
  end
end


#have to go add to edit_item when there are more item fields
get '/items/:i_id/edit' do
 if session[:id]
  @item = Item.find(params[:i_id])
  erb :edit_item
 else
   redirect '/'
 end
end


post '/items/:i_id/edit' do
  #do edit stuff
  #what happens if I user does not fill in all edit forms?
  #add item attributes here
 if session[:id]
   Item.find(params[:i_id]).update_attributes(name: params[:name])
   redirect "/users/#{session[:id]}/profile"
 else
   redirect '/'
 end
end

#tough time with delete route -> restless
get '/items/:i_id' do
  if session[:id]
     Item.find(params[:i_id]).destroy
     redirect "/users/#{session[:id]}/profile"
  else
   redirect '/'
  end
end

get 'items/info/:i_id' do
  if session[:id]
     Item.find(params[:i_id]).destroy
     redirect "/users/#{session[:id]}/profile"
  else
    erb :item_info_page #make this
  end
end




