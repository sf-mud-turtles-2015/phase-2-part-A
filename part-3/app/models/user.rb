# require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}
  # Remember to create a migration!
  has_many :items
  has_many :bids
end
