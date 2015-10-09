class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.string  :category, null: false
      t.integer :minimum_bid, null: false
      t.string  :status, null: false
      t.timestamps
    end
  end
end
