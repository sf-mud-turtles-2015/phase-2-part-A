class Bid < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :bidable, polymorphic: true
end
