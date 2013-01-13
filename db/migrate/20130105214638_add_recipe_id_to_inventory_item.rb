class AddRecipeIdToInventoryItem < ActiveRecord::Migration
  def change
    add_column :inventory_items, :recipe_id, :integer
  end
end
