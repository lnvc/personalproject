class CreateSavings < ActiveRecord::Migration[5.2]
  def change
    create_table :savings do |t|
      t.date :month
      t.integer :target
      t.integer :currvalue

      t.timestamps
    end
  end
end
