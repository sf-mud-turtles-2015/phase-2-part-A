10.times do 
	User.create({username: Faker::Internet.user_name, password: Faker::Internet.password(8)})
end

50.times do
	Item.create({name: Faker::Commerce.product_name, category: Faker::Commerce.department, minimum_bid: 10, status: "for sale", user_id: rand(1..10)})
end

1000.times do
	Bid.create({value: rand(1000000), user_id: rand(1..8), item_id: rand(50)})
end
