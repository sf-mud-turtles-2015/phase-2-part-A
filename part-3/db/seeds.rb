require 'faker'

User.delete_all
Item.delete_all
Bid.delete_all

users = 15.times do
  User.create!(:name => Faker::Name.name,
    :password => "password",
    :email => Faker::Internet.email)
end

items = 15.times do
  Item.create!(:title => Faker::Commerce.product_name,
    :description => Faker::Lorem.sentence,
    :start_bid => "2015-10-15",
    :end_bid => "2015-10-20",
    :user_id => rand(15),
    :initial_price => Faker::Commerce.price)
end

# users.each do |user|
#   user_items = items.sample(rand(2..4))
#   user_items.each do |item|
#     Bid.create!(user: user,
#                          item: item)
#   end
# end