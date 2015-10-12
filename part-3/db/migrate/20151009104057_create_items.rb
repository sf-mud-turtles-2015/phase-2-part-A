class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    t.string :name, null: false
    t.string :cost, null: false
    t.string :user_id, null: false

    t.timestamps null: false
    end
  end
end
