Bid.create(price: 10.00, user_id:2, item_id:1, top_bid: true)
Bid.create(price: 7.00, user_id:3, item_id:1, top_bid: false)
Bid.create(price: 9.00, user_id:2, item_id:1, top_bid: false)

User.create(username: 'tester1', password: '111')
User.create(username: 'tester2', password: '111')
User.create(username: 'tester3', password: '111')


Item.create(name:'test1', description:'testtesttest', price: 7.00 , user_id:1, start_date:'10/9/2015', end_date:'10/10/2015' )
Item.create(name:'test1', description:'testtesttest', price: 8.00, user_id:1, start_date:'10/7/2015', end_date: '10/8/2015', active: false)
Item.create(name:'test1', description:'testtesttest', price: 9.00, user_id:1, start_date:'10/8/2015', end_date: '10/10/2015')
