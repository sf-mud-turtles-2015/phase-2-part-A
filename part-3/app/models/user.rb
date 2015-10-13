class User < ActiveRecord::Base
  has_many :bids
  has_many :items

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, :length => {:within => 6..90}
end
