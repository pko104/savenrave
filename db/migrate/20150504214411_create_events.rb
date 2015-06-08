class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date, null: false
      t.time :time, null: false
    end
  end
end
