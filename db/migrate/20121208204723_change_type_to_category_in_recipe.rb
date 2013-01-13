class ChangeTypeToCategoryInRecipe < ActiveRecord::Migration
  def up
    remove_column :recipes, :type
    add_column :recipes, :category, :string
  end

  def down
    remove_column :recipes, :category
    add_column :recipes, :type, :string
  end
end
