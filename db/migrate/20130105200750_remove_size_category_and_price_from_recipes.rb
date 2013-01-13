class RemoveSizeCategoryAndPriceFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :size
    remove_column :recipes, :category
    remove_column :recipes, :price
  end

  def down
  end
end
