class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :value, null: false
      t.references :items
      t.references :user
      t.timestamps
    end
  end
end
