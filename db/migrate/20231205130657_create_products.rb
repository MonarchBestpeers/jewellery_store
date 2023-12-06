class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantity_available
      t.string :material
      t.string :image

      t.timestamps
    end
  end
end
