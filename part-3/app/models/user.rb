class User < ActiveRecord::Base
  validates :user_name, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_many :items
end
