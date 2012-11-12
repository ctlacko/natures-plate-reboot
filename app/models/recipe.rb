class Recipe < ActiveRecord::Base
  attr_accessible :calories, :carbohydrates, :description, :fat, :fiber, :price, :protein, :title
end
