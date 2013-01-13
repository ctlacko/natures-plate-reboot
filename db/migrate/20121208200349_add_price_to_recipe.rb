class AddPriceToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :price, :float
  end
end
