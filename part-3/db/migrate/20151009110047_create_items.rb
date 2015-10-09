class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.datetime :open
      t.datetime :close

      t.integer :owner_id
    end
  end
end
