class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :count, default: 0 #does this set the default to 0??
      t.integer :item_id
    end
  end
end
