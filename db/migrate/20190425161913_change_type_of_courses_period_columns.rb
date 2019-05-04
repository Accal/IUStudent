class ChangeTypeOfCoursesPeriodColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :courses, :period1, :string
    change_column :courses, :period2, :string
<<<<<<< HEAD
=======
    change_column :courses, :period1, :time
    change_column :courses, :period2, :time 
>>>>>>> 7b69127a83aed6e5e622cd4f9f86c14f81204aa9
  end
end
