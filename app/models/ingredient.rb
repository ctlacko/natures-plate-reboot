class Ingredient < ActiveRecord::Base
  attr_accessible :description, :title

  has_one :image, as: :image_reference 
  has_many :recipe_rel_ingredients
  #has_and_belongs_to_many :recipes
  has_many :ingredients, :through => :recipe_rel_ingredients
end
