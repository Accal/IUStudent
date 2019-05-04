class CreateStudentsCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_students, id: false do |t|
      t.belongs_to :student, index: true
      t.belongs_to :course, index:true
    end
  end
end
