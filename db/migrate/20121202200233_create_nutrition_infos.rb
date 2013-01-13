class CreateNutritionInfos < ActiveRecord::Migration
  def change
    create_table :nutrition_infos do |t|
      t.integer :recipe_id
      t.float :calories
      t.float :protein
      t.float :fat
      t.float :carbohydates
      t.float :fiber

      t.timestamps
    end
  end
end
