class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, limit: 30, null: false
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.text :note, limit: 100
      t.boolean :all_day, null: false

      t.timestamps
    end
  end
end
