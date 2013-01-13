class CreateRecipeRelIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_rel_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
