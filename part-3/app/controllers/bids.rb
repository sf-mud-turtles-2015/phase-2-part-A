#########################
# bid Routes
#########################

post '/bid/item/:id' do
  @bid = Bid.create(params[:bid])

  redirect "/item/#{params[:bid][:item_id]}"
end
