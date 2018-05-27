class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :name
      t.boolean :status
      t.integer :priority
      t.date :deadline

      t.timestamps
    end
  end
end
