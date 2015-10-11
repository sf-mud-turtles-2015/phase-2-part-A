class Bid < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  validates :value, presence: true
end
