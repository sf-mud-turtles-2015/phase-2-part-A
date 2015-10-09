class User < ActiveRecord::Base
  validates :user_name, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_many :items
  has_and_belongs_to_many :bids
end
