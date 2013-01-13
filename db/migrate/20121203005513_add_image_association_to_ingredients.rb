class AddImageAssociationToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :image_reference_id, :integer
    add_column :ingredients, :image_reference_type, :string


    add_index :ingredients, [:image_reference_id]
  end
end
