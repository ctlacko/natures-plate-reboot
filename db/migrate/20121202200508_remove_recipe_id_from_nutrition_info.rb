class RemoveRecipeIdFromNutritionInfo < ActiveRecord::Migration
  def up
    remove_column :nutrition_infos, :recipe_id
  end

  def down
    add_column :nutrition_infos, :recipe_id, :integer
  end
end
