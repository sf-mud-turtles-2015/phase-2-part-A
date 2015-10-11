class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
