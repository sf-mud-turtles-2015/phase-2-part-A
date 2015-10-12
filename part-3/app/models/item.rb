class Item < ActiveRecord::Base

  has_many :users
  has_many :bids

  validates :name, :user_id, :start_date, :end_date, presence: true

end
