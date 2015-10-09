class User < ActiveRecord::Base
  has_many :items
  has_many :bids
  validates :name, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    if new_password.length <= 6
      return nil
    else
      @password = Password.create(new_password)
      self.password_hash = @password
    end
  end


end
