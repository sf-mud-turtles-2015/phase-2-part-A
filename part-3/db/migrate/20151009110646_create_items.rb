class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, :null => false
      t.string :description
      t.datetime :start_bid, :null => false
      t.datetime :end_bid, :null => false
      t.integer :initial_price, :null => false
      t.integer :user_id

      t.timestamp
    end
  end
end
