class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :price
      t.integer :user_id
      t.integer :item_id
      t.boolean :top_bid, default: false
    end
  end
end
