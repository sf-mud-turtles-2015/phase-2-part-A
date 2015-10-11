class Item < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :bids

  def active?
    if self.start_date < Time.now && self.end_date > Time.now
      true
    else
      false
    end
  end

end
