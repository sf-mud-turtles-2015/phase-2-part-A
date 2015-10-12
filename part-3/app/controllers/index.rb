get '/' do
  erb :welcome
end

get '/index' do
  @items = Item.all

  erb :index

end


