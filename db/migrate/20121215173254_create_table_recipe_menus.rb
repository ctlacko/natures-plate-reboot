class CreateTableRecipeMenus < ActiveRecord::Migration
  def up
    create_table :menus_recipes do |t|
      t.integer :recipe_id
      t.integer :menu_id
    end
  end

  def down
    drop_table :menu_recipes
  end
end
