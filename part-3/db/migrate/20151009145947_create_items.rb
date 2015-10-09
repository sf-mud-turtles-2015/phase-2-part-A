class CreateItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.string :name
  		t.string :description
  		
  		t.references :user

  		t.date :start_date
  		t.date :end_date
  		t.timestamps null: false
  	end   	
  end
end
