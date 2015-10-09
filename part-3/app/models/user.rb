class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :items
  has_many :bids

  validates :username, uniqueness: true
  validates_length_of :password, minimum: 6, too_short: "please enter at least 6 characters"
end
