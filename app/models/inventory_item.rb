class InventoryItem < ActiveRecord::Base
  attr_accessible :category, :price, :quantity

  belongs_to :recipe
end
