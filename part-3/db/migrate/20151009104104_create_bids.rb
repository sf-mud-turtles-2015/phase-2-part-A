class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
    t.integer :user_id, null: false
    t.integer :item_id, null: false
    t.integer :amount, null: false

    t.timestamps null: false
    end
  end
end
