class Recipe < ActiveRecord::Base
  # getters and setters
  attr_accessible :description, :title, :ingredient_ids, :nutrition_info_attributes, :nutrition_info_id, :inventory_items_attributes, :category 

  # relationships
  has_one :nutrition_info
  has_many :inventory_items
  has_and_belongs_to_many :ingredients

  # validations
  # validates_presence_of :size, :category, :title, :on => :create

  # helpers
  accepts_nested_attributes_for :nutrition_info, allow_destroy: true
  accepts_nested_attributes_for :inventory_items, allow_destroy: true
end
