class CreateBids < ActiveRecord::Migration
  def change
      create_table :bids do |t|
        t.integer :bid_amount
        t.integer :user_id
        t.integer :item_id
    end
  end
end
