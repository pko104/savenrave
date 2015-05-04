class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :price, null: false
      t.integer :ticket_id, null: false
      t.integer :user_id, null: false
    end
  end
end
