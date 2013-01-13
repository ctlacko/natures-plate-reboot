class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.float :price
      t.string :category
      t.string :quantity

      t.timestamps
    end
  end
end
