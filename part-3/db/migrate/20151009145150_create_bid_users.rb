class CreateBidUsers < ActiveRecord::Migration
  def change
    create_table :bid_users do |t|
      t.integer :bid_id
      t.integer :user_id
    end
  end
end
