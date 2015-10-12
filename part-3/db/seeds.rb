
require 'faker'
USERS = 3
BIDS = 5
ITEMS = 10
#create 20 users
USERS.times do
  user = User.create!(
    name: Faker::Name.name,
    password: "mj1212mj")


  #create active items with start_date before today and end_date after
  ITEMS.times do
    Item.create!(
      item_title: "ACTIVE should be seen in home page",
      item_description:  Faker::Lorem.characters(60),
      start_date: Time.utc(2010, 1 ,1,20,15,1).to_i,
      end_date: Time.utc(2015, 12 ,1,20,15,1).to_i,
      user_id: rand(1..USERS))

    BIDS.times do
      Bid.create!(
      user_id: rand(1..USERS),
      item_id: rand(1..ITEMS),
      bid_amount: rand(100))
    end
  end
  #create non active as end_date is in the past
  ITEMS.times do
    Item.create!(
      item_title: "NOT ACTIVE and WON should not be seen in home page",
      item_description:  Faker::Lorem.characters(60),
      start_date: Time.utc(2010, 1 ,1,20,15,1).to_i,
      end_date: Time.utc(2011, 1 ,1,20,15,1).to_i,
      user_id: rand(1..USERS))

    BIDS.times do
      Bid.create!(
      user_id: rand(1..USERS),
      item_id: rand(1..ITEMS),
      bid_amount: rand(30))
    end
  end
end
