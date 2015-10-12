get '/items/new' do

  erb :'/items/new'
end

get '/items/:id/delete' do
  p "here"
  @item = Item.find(params[:id])
  @item.destroy
  bids = Bid.where(item_id: params[:id])
  bids.each do |bid|
    bid.destroy
  end

  redirect '/users/:id'
end

get '/items/:id/update' do
  @item = Item.find(params[:id])

  erb :'/items/update'
end

post '/items/:id/update' do
  Item.update_all(params[:item])

  redirect '/users/:id'
end

get '/items/:id' do
  @item = Item.find(params[:id])

  erb :'/items/item'
end

post '/items' do
  item = Item.create(params[:item])

  redirect '/users/:id'
end

