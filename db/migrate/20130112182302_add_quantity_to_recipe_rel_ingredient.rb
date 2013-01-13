class AddQuantityToRecipeRelIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_rel_ingredients, :quantity, :integer
  end
end
