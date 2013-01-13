class NutritionInfo < ActiveRecord::Base
  attr_accessible :calories, :carbohydates, :fat, :fiber, :protein 

  belongs_to :recipe
end
