class RecipeRelIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id, :quantity

  belongs_to :recipe
  belongs_to :ingredient
end
