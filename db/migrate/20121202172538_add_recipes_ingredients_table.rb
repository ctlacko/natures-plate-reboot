class AddRecipesIngredientsTable < ActiveRecord::Migration
  def up
    create_table :recipes_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end

  def down
    drop_table :recipes_ingredients
  end
end
