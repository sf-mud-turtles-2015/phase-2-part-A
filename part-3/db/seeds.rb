
require 'faker'

#create 20 users
20.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "mj1212mj")
  # active items not won
  5.times do
    Item.create!(
      item_title: Faker::Team.name,
      item_description: Faker::Lorem.characters(30) ,
      won:  false,
      active: true,
      start_date: Faker::Time.backward(14, :evening),
      end_date: Faker::Time.forward(10, :morning),
      user_id: rand(20))
    #create bids for active items
    10.times do
      Bid.create!(
      user_id: rand(20),
      item_id: rand(20),
      price: rand(10..100))
    end
  end
  #create won items
  5.times do
    Item.create!(
      item_title: Faker::Team.name,
      item_description:  Faker::Lorem.characters(30),
      won:  true,
      active: false,
      start_date: Faker::Time.backward(14, :evening),
      end_date: Faker::Time.forward(23, :morning),
      user_id: rand(20))

    5.times do
      Bid.create!(
      user_id: rand(20),
      item_id: rand(20),
      price: rand(10..100))
    end
  end
  #create won false and not active
  5.times do
    Item.create!(
      item_title: Faker::Team.name,
      item_description:  Faker::Lorem.characters(30),
      won:  false,
      active: false,
      start_date: Faker::Time.backward(14, :evening),
      end_date: Faker::Time.backward(3, :morning),
      user_id: rand(20))

    5.times do
      Bid.create!(
      user_id: rand(20),
      item_id: rand(20),
      price: rand(10..100))
    end
  end
end
