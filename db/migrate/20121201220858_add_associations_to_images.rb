class AddAssociationsToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_reference_id, :integer 
    add_column :images, :image_reference_type, :string

    add_index :images, [:image_reference_id, :image_reference_type] 
  end
end
