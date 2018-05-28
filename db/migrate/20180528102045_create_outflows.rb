class CreateOutflows < ActiveRecord::Migration[5.2]
  def change
    create_table :outflows do |t|
      t.date :spent
      t.text :item
      t.integer :price

      t.timestamps
    end
  end
end
