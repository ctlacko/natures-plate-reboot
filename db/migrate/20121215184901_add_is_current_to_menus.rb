class AddIsCurrentToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :is_current, :boolean
  end
end
