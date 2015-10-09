class AddAdditionalToItems < ActiveRecord::Migration
  def change
    add_column :items, :description, :string
    add_column :items, :start_date, :string
    add_column :items, :stop_date, :string

  end
end
