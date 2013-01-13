class AddSizeToInventoryItem < ActiveRecord::Migration
  def change
    add_column :inventory_items, :size, :string
  end
end
