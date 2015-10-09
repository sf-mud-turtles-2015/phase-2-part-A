class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :amount
      t.integer :bidder_id
      t.integer :item_id
    end
  end
end
