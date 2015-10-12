5.times do 
	user = User.create!(
		username: Faker::Internet.user_name,
		password: 123456
		)
	item = user.items.create!(
		name: Faker::Lorem.word,
		description: Faker::Lorem.sentence(2)
		)
	bid = item.bids.create(
	 	offer: Faker::Commerce.price
	 	)
	
end