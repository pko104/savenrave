class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.string :description, null: false
      t.integer :user_id, null: false
    end
  end
end
