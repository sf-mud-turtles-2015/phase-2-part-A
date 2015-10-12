class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :item_title
      t.string  :item_description
      t.integer :start_date
      t.integer :end_date
      t.integer :user_id
    end
  end
end
