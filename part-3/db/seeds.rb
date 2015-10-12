User.create(username: 'tony', password: 'password')

Item.create([{name: 'iphone', cost: 200,description: 'slightly used', start_date: '2015-10-11', stop_date: '2015-10-20', user_id: 1},
  {name: 'expired', cost: 200,description: 'should not be able to see me', start_date: '2015-10-09', stop_date: '2015-10-10', user_id: 1}])