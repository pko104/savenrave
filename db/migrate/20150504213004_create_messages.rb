class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :description, null: false
      t.integer :user_id, null: false
      t.integer :chatroom_id, null: false
    end
  end
end
