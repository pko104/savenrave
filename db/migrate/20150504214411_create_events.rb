class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :date, null: false
      t.integer :time, null: false
    end
  end
end
