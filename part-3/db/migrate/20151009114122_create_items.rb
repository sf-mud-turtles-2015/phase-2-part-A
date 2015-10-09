class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :date_start
      t.string :date_end
      t.integer :user_id
    end
  end
end
