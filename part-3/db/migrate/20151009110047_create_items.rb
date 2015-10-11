class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.date :open
      t.date :close

      t.integer :owner_id
    end
  end
end
