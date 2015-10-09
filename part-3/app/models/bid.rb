class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  # Remember to create a migration!
end
