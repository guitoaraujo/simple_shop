class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
