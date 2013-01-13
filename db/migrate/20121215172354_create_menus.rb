class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :startDate
      t.date :endDate
      t.date :pickUpDate

      t.timestamps
    end
  end
end
