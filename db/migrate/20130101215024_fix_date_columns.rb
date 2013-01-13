class FixDateColumns < ActiveRecord::Migration
  def change
    rename_column :menus, :startDate, :start_date
    rename_column :menus, :endDate, :end_date
  end
end
