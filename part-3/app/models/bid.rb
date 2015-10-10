class Bid < ActiveRecord::Base
  #
  belongs_to :user
  belongs_to :item



# maybe use a helper method to do something
# not sure how to use them though.
# the idea is when someone click on place vote it creates a new bid with the item_id
#
# **Some more things to work on
# how do I tie in the join table.. is it needed?
# using dates to display aviable bids
# css
# getts the bids to vote up...
# i think there is some other stuff....


  def up_count
    puts "X" * 100
    p count
    puts "X" * 100

    # self.count += 1
  end
end
