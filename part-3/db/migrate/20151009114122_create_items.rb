class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id
    end
  end
end
