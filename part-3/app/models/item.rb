class Item < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :bids

  def points
    bids.sum(:value )
  end

end
