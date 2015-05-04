class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.string :description, null: false
      t.integer :ticket_id, null: false
    end
  end
end
