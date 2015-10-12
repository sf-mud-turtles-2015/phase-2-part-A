class Item < ActiveRecord::Base
  belongs_to :user
  has_many :bids


  def active?
    if self.end_date < Date.today
      self.update(:active => 'false')
   else
      self.update(:active => 'true')
    end
  end

validates :name, :user_id, :description, :price, :start_date, :end_date, presence: true
validates_numericality_of :price, :on => :create
end
