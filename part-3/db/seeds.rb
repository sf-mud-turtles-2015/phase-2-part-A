require 'faker'

20.times do #Seed the username database
  User.create(username: Faker::Name.first_name, password: 123456)
end

50.times do #Seed the item database
  Item.create(user_id: rand(1..20), name: Faker::Commerce.product_name, description: Faker::Lorem.sentences(rand(2..5)).join(" "), start_date: Faker::Time.between(DateTime.now - 4, DateTime.now), end_date: Faker::Time.between(DateTime.now, DateTime.now + 1))
end
