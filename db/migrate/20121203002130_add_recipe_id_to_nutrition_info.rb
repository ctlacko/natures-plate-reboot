class AddRecipeIdToNutritionInfo < ActiveRecord::Migration
  def change
    add_column :nutrition_infos, :recipe_id, :integer
  end
end
