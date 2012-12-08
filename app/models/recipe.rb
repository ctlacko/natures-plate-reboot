class Recipe < ActiveRecord::Base
  attr_accessible :description, :title, :ingredient_ids, :nutrition_info_attributes 

  has_one :nutrition_info

  accepts_nested_attributes_for :nutrition_info, allow_destroy: true

  has_and_belongs_to_many :ingredients
end
