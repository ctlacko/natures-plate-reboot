class RemoveNutritionAndPriceFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :price
    remove_column :recipes, :calories
    remove_column :recipes, :protein
    remove_column :recipes, :fat
    remove_column :recipes, :carbohydrates
    remove_column :recipes, :fiber
  end

  def down
  end
end
