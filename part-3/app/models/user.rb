require 'bcrypt'

class User < ActiveRecord::Base

  has_many :items
  has_many :bids

  validates :username, presence: true, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
