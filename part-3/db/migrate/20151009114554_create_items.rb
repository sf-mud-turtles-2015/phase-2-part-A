class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :description
      t.string :start_date
      t.string :end_date
      t.integer :user_id

      t.timestamps
    end
  end
end
