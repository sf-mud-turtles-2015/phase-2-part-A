class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, :null => false
      t.string :description
      t.datetime :start_bid#, :null => false # when the bid starts
      t.datetime :end_bid#, :null => false # when the bid ends
      t.integer :initial_price#, :null => false
      t.integer :user_id # this is the owner of the item, which is a more generally a user

      t.timestamp
    end
  end
end
