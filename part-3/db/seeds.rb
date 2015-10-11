
User.create(username: 'grant', password: 111111)
User.create(username: 'daniel', password: 111111)
User.create(username: 'joji', password: 111111)

Item.create(name: 'monitor', description: 'not the lizard', user_id: 1, start_date: "2015-07-06", end_date: "2015-12-25")
Item.create(name: 'lizard', description: 'the thing is cold-blooded and has scales', user_id: 1, start_date: "2015-07-06", end_date: "2015-12-01")
Item.create(name: 'crayons', description: '10 crayons, used, unwrapped, not sharp', user_id: 2, start_date: "2015-07-06", end_date: "2015-12-01")
Item.create(name: 'wood', description: 'dead tree', user_id: 3, start_date: "2015-07-06", end_date: "2015-12-01")
Item.create(name: 'shouldnotbeactive1',  description: 'auctioned but now not available1', user_id: 2, start_date: "2015-07-06", end_date: "2015-08-01")
Item.create(name: 'shouldnotbeactive2',  description: 'auctioned but now not available2', user_id: 2, start_date: "2015-07-06", end_date: "2015-08-01")
Item.create(name: 'realtimeobject',  description: 'quicktest', user_id: 2, start_date: "2015-07-06", end_date: "2015-10-10 17:09:36 -0700")



Bid.create(value: 100, user_id: 1, item_id: 4)
Bid.create(value: 150, user_id: 2, item_id: 4)

