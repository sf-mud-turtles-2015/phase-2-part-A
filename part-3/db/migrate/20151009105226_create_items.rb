class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :bid
      t.datetime :auction_begin
      t.datetime :auction_end
    end
  end
end
