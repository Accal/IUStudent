class ChangeTypeOfCoursesPeriodColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :courses, :period1, :string
    change_column :courses, :period2, :string
    change_column :courses, :period1, :time
    change_column :courses, :period2, :time 
  end
end
