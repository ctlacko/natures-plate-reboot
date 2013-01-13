class AddSizeAndTypeToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :size, :string
  end
end
