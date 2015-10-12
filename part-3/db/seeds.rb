require 'faker'
p "in the seed file"

30.times do
  User.create(username: Faker::Name.name, password: Faker::Internet.password(8))
end

30.times do
  Item.create(name: Faker::App.author, description: Faker::Name, bid: rand(0..50), auction_begin: Faker::Time.forward(23, :morning), auction_end: Faker::Time.forward(23, :evening), user_id: rand(1..30))
end


30.times do
  Bid.create(amount: rand(0..50))
end
