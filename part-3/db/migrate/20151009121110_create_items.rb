class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :start
      t.string :finish
      t.integer :user_id
    end
  end
end
