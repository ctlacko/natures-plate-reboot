class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.decimal :price
      t.decimal :calories
      t.decimal :protein
      t.decimal :fat
      t.decimal :carbohydrates
      t.decimal :fiber
      t.text :description

      t.timestamps
    end
  end
end
