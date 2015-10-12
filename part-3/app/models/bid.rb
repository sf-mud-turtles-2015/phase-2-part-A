class Bid < ActiveRecord::Base
  # Remember to create a migration!
  validates :offer, presence: true #, numericality: { greater_than_or_equal_to: last_bid}
  belongs_to :bidable, polymorphic: true


end
