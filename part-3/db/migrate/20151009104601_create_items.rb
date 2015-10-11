class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string      :name, null: false
      t.string      :category, null: false
      t.integer     :minimum_bid, null: false
      t.string      :status, null: false
      t.datetime    :start_date
      t.datetime    :end_date
      t.references  :user
      t.timestamps
    end
  end
end
