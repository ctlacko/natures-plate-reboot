class CreateRecipesInventoryItemsTable < ActiveRecord::Migration
  def change
    create_table :recipes_inventory_items do |t|
      t.integer :inventory_item_id
      t.integer :recipe_id
    end
  end
end
