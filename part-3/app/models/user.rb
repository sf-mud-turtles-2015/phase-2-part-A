require 'bcrypt'
class User < ActiveRecord::Base
  # include BCrypt
  # Remember to create a migration!
  has_many :items, class_name: :Item, foreign_key: :seller_id

  validates :user, presence: true, uniqueness: true
# =>  validation works without bcrypt, not working with bcrypt, skip bcrypt
  validates :password_hash, presence: true, length: { minimum: 6 }

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
end


# User.create(user: 'a' , password_hash: 'aaaaaa')
