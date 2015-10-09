class Item < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user, foreign_key: :user_id
  has_many :bids
end
