
User.create(username: "James Johnson", password: "secretpassword")
User.create(username: "Mary Smith", password: "secretpassword")
User.create(username: "Tom Christianson", password: "secretpassword")
User.create(username: "Lou Dobbs", password: "secretpassword")
User.create(username: "Cindy Shafer", password: "secretpassword")

15.times do
  Item.create(title: "Random Item", detail: "I am selling this old piece of furniture blah blah blah.", user_id: rand(1..5), condition: "good", start_date: "2015-04-01", end_date: "2015-08-01")
end

15.times do
  Bid.create(amount: "30.00", user_id: rand(1..5), item_id: rand(1..15))
end

