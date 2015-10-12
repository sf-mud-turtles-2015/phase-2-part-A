class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |field|
      field.string :title
      field.string :detail
      field.string :condition
      field.string :start_date
      field.string :end_date
      field.integer :user_id


      field.timestamps
    end
  end
end
