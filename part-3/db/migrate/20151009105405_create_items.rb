class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :description, :start, :end, null: false
      t.integer :bid_price, :seller_id, :bidder_id, null: false
    end
  end
end
