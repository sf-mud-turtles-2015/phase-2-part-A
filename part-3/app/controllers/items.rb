get '/item/:i_id' do
  @item = Item.find(params[:i_id])
  erb :view_item
end

post "/item/<%= @item.id %>/bid" do
#make a bid item
end
