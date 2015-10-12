class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |field|
      field.string :username, null: false
      field.string :password, null: false

      field.timestamps
    end
  end
end
