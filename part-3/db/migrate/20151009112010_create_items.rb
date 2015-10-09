class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_title
      t.string :item_description
      t.boolean :won, default: false
      t.boolean :active, default: true
      t.string :start_date
      t.string :end_date
      t.integer :user_id
    end
  end
end
