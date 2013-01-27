class OnlyOneValidator < ActiveModel::Validator
  def validate(record)
    
    # iterate menus
    # check start and end dates against this record's start and end date
    Menu.all.each do |menu|
      if record.start_date.between?(menu.start_date, menu.end_date)
        record.errors[:start_date] << "There is already a menu available during that start date."
        return
      end
      if record.end_date.between?(menu.start_date, menu.end_date)
        record.errors[:start_date] << "There is already a menu available during that start date."
        return
      end
    end
  end
end
class Menu < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessible :end_date, :pickUpDate, :start_date, :recipe_ids, :is_current 

  #validates_with OnlyOneValidator

  has_and_belongs_to_many :recipes
end

