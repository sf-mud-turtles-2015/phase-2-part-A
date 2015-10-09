class CreateBids < ActiveRecord::Migration
  def change
  	create_table :bids do |t|
  		t.integer :amount
  		
  		t.references :bidable, polymorphic: true, index: true

  		t.date :start_date
  		t.date :end_date
  		t.timestamps null: false
  	end   	
  end
end
