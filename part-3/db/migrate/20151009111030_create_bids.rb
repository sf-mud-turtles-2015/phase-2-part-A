class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |field|
      field.string :amount, null: false
      field.integer :item_id, null: false
      field.integer :user_id, null: false

      field.timestamps
    end
  end
end
