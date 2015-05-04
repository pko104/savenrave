class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :event_id, null: false
      t.integer :postdate, null: false
      t.integer :enddate, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false
    end
  end
end
