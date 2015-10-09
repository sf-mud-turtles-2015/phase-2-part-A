class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :items

  validates :user, presence: true, uniqueness: true
  validates :password_hash, presence: true, length: { minimum: 6 }
end


# User.create(user: 'a' , password_hash: 'aaaaaa')
