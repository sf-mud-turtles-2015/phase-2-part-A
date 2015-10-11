User.create(email: 'katie@katie.com', password: 'okdonga')
User.create(email: 'daniel@daniel.com', password: 'danieldd')
Item.create(title: 'bag', description: 'big', start_date: '2015-1-26', end_date: '2015-6-14', user_id: 1)
Item.create(title: 'bag', description: 'big', start_date: '2015-1-26', end_date: '2016-6-14', user_id: 1)
Bid.create(amount: 2, item_id: 1, user_id: 1)
Bid.create(amount: 6, item_id: 2, user_id: 2)
Bid.create(amount: 1, item_id: 2, user_id: 2)

