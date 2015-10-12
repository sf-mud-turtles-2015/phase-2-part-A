class User < ActiveRecord::Base
  has_many :bids
  has_many  :items
  validates :username, uniqueness: true
  # validates :password, length: { minimum: 6}
# include 'BCrypt'



end
