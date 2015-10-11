post '/bid/:id' do
  p "*" * 80
  p params
  p "*" * 80
  p params[:id]
  p "*" * 80
  @user = User.find(session[:user_id])
  # @item = Item.find(params[:id])
  @bid = Bid.create({value: params[:value], user_id: session[:user_id], item_id: params[:id]})
  @placed_text = "Thank you for your bid. Good luck!"
  redirect "/#{params[:id]}"
end
