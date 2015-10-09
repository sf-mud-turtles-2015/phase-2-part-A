class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |field|
      field.string :title, null: false
      field.string :detail, null: false
      field.string :condition
      field.string :start_date, null: false
      field.string :end_date, null: false
      field.integer :user_id, null: false
      field.integer :bid_id

      field.timestamps
    end
  end
end
