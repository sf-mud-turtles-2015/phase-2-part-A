class CreateItems < ActiveRecord::Migration
  def change
     create_table :items do |t|
        t.string :name
        t.text :description
        t.float :price
        t.integer :user_id
        t.date :start_date
        t.date :end_date
        t.boolean :active, default: true
      end
  end
end
