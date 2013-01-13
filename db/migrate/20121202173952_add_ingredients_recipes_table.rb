class AddIngredientsRecipesTable < ActiveRecord::Migration
  def up
    create_table :ingredients_recipes do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end

  def down
    drop_table :ingredients_recipes
  end
end
