class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :value
      t.integer :item_id
    end
  end
end
