class User < ActiveRecord::Base
  has_many :items
  has_many :bids
  validates :name, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


  #returns an array of item objects, bids for a user
  def user_bids
    @bid_on_items = []
    self.bids.each{|bid| @bid_on_items << Item.find(bid.item_id)}
    @bid_on_items
  end

end
