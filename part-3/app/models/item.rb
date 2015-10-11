class Item < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :bids, dependent: :destroy

  def points
    bids.sum(:amount )
  end

  def max
    self.bids.max_by do |bid|
      bid.amount
    end
  end
  # bid that has the max bid amount = 20

end
