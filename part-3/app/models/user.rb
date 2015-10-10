class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_many :items
  has_many :bids
  has_many :potential_items, through: :bids, source: :item

  def completed_auctions
    self.potential_items.where(["finish < ?", Date.today.to_s.scan(/\d/).join.to_i])
  end

  def auctions_won
    winner = []
    completed_auctions.each do |item|
      high = item.bids.order(amount: :desc).first.amount
      winning_bid = Bid.find_by(item_id: item.id, amount: high)
      if winning_bid.bidder.id == self.id
        winner << item
      end
    end
  end
end
