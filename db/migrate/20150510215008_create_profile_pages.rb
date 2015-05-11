class CreateProfilePages < ActiveRecord::Migration
  def change
    create_table :profile_pages do |t|
      t.integer :user_id, null: false
    end
  end
end
