class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :description, null: false
      t.integer :bid_price, :start, :end, null: false
      t.integer :bidder_id, :seller_id
    end
  end
end
