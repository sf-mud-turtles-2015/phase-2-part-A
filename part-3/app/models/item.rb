class Item < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :bids

  validates :name,:cost,:description,:start_date,:stop_date, presence: true

end
