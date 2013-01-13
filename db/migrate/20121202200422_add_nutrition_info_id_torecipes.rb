class AddNutritionInfoIdTorecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :nutrition_info_id, :integer
  end

  def down
    remove_column :recipes, :nutrition_info_id
  end
end
