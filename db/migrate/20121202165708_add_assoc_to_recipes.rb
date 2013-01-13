class AddAssocToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :image_reference_id, :integer 
    add_column :recipes, :image_reference_type, :string

    add_index :recipes, [:image_reference_id, :image_reference_type] 
  end
end
